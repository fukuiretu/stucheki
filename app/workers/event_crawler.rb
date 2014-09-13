require "event_crawler/common"
require "event_crawler/atnd_event_crawler"

class EventCrawler
  TRUNCATE_QUERY_TO_TMP_EVENTS = "TRUNCATE TABLE tmp_events"

  TRUNCATE_QUERY_TO_EVENT_TAG_MAPS = "TRUNCATE TABLE tmp_event_tag_maps"

  INSERT_QUERY_TO_EVENTS = <<-EOS
    INSERT INTO events
      (
        service_type,
        service_event_id,
        title,
        started_at,
        ended_at,
        address,
        place,
        link
      )
      SELECT
        a.service_type,
        a.service_event_id,
        a.title,
        a.started_at,
        a.ended_at,
        a.address,
        a.place,
        a.link
        FROM
          tmp_events a LEFT OUTER JOIN events b on a.service_type = b.service_type
            AND a.service_event_id = b.service_event_id
        WHERE
          b.id IS NULL
  EOS

  UPDATE_QUERY_TO_EVENTS = <<-EOS
    UPDATE events a
      INNER JOIN tmp_events b on a.service_type = b.service_type
        AND a.service_event_id = b.service_event_id
      SET a.title = a.title, a.started_at = b.started_at,
        a.ended_at = b.ended_at, a.address = b.address, a.place = b.place,
        a.link = b.link, a.updated_at = b.updated_at
  EOS

  INSERT_QUERY_TO_EVENT_TAG_MAPS = <<-EOS
    INSERT INTO event_tag_maps
      (
        service_type,
        service_event_id,
        tag_id
      )
      SELECT
        a.service_type,
        a.service_event_id,
        a.tag_id
        FROM
          tmp_event_tag_maps a LEFT OUTER JOIN event_tag_maps b on a.service_type = b.service_type
            AND a.service_event_id = b.service_event_id
        WHERE
          b.id IS NULL
  EOS

  def self.create_instance(service_name)
    Object.const_get("EventCrawler::#{service_name.classify}EventCrawler").new
  end

  def self.merge_tmp_to_origin
    ActiveRecord::Base.connection.begin_db_transaction
    ActiveRecord::Base.connection.execute(UPDATE_QUERY_TO_EVENTS)
    ActiveRecord::Base.connection.execute(INSERT_QUERY_TO_EVENTS)
    ActiveRecord::Base.connection.execute(INSERT_QUERY_TO_EVENT_TAG_MAPS)
    ActiveRecord::Base.connection.commit_db_transaction

    TmpEvent.connection.execute(TRUNCATE_QUERY_TO_TMP_EVENTS)
    TmpEvent.connection.execute(TRUNCATE_QUERY_TO_EVENT_TAG_MAPS)
  end
end
