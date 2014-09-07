require "event_collector/atnd_event_collector"

class EventCollector
  TRUNCATE_QUERY_TO_TMP_EVENTS = "TRUNCATE TABLE tmp_events"

  INSERT_QUERY_TO_EVENTS = "INSERT INTO events
    (
      service_type,
      service_event_id,
      title,
      tag,
      started_at,
      ended_at,
      place,
      link
    )
    SELECT
      a.service_type,
      a.service_event_id,
      a.title,
      a.tag,
      a.started_at,
      a.ended_at,
      a.place,
      a.link
      FROM
        tmp_events a LEFT OUTER JOIN events b on a.service_type = b.service_type
          AND a.service_event_id = b.service_event_id
      WHERE
        b.id IS NULL"

  UPDATE_QUERY_TO_EVENTS = "UPDATE events a
    INNER JOIN tmp_events b on a.service_type = b.service_type
      AND a.service_event_id = b.service_event_id
    SET a.title = a.title, a.tag = a.tag, a.started_at = b.started_at,
      a.ended_at = b.ended_at, a.place = b.place, a.link = b.link, a.updated_at = b.updated_at"

  def self.factory(service_name)
    Object.const_get("Scheduler::EventCollector::#{service_name.classify}EventCollector").new()
  end

  def self.merge_events
    ActiveRecord::Base.connection.begin_db_transaction
    ActiveRecord::Base.connection.execute(UPDATE_QUERY_TO_EVENTS)
    ActiveRecord::Base.connection.execute(INSERT_QUERY_TO_EVENTS)
    ActiveRecord::Base.connection.commit_db_transaction

    TmpEvent.connection.execute(TRUNCATE_QUERY_TO_TMP_EVENTS)
  end
end
