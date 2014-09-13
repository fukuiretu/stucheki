class EventCrawler
  class AtndEventCrawler
    include Common

    def execute
      Tag.all.each do |tag|
        yms.each do |ym|
          collect(tag, ym)
        end
      end
    end

    private
      def yms
        # TODO
        ["201409", "201410"]
      end

      def collect(tag, ym)
        start = 1
        loop do
          sleep(Settings.api_req_wait_seconds.to_i) if start > 1

          res = call_for_get(
            Settings.endpoint[:atnd],
            "/events",
            {
              keyword_or: tag.content,
              ym: ym,
              start: start,
              count: 1,
              format: "json"
            }
          )
          data = ActiveSupport::JSON.decode(res)

          results_returned = data["results_returned"]
          break if results_returned == 0

          # bulk insertする
          tmp_events = []
          tmp_event_tag_maps = []
          data["events"].each do |event|
            event_data = event["event"]

            tmp_events << TmpEvent.new.tap do |tmp_event|
              tmp_event.service_type = Event.service_types[:atnd]
              tmp_event.service_event_id = event_data["event_id"]
              tmp_event.title = event_data["title"]
              tmp_event.started_at =
                Time.parse(event_data["started_at"]).strftime("%Y-%m-%d %H:%M:%S") unless event_data["started_at"].nil?
              tmp_event.ended_at =
                Time.parse(event_data["ended_at"]).strftime("%Y-%m-%d %H:%M:%S") unless event_data["ended_at"].nil?
              tmp_event.address = event_data["address"]
              tmp_event.place = event_data["place"]
              tmp_event.link = event_data["event_url"]
            end

            tmp_event_tag_maps << TmpEventTagMaps.new.tap do |tmp_event_tag_map|
              tmp_event_tag_map.service_type = Event.service_types[:atnd]
              tmp_event_tag_map.service_event_id = event_data["event_id"]
              tmp_event_tag_map.tag_id = tag.id
            end
          end

          TmpEvent.import(tmp_events)
          TmpEventTagMaps.import(tmp_event_tag_maps)

          start = start + results_returned
        end
      end
  end
end
