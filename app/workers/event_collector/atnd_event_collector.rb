class EventCollector
  class AtndEventCollector
    include Common

    def execute
      tags = Tag.all

      tags.each do |tag|
        yms.each do |ym|
          collect(tag.content, ym)
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
          sleep(1) if start > 1

          res = call_for_get(
            Settings.endpoint[:atnd],
            "/events",
            {
              keyword_or: tag,
              ym: ym,
              start: start,
              count: 100,
              format: "json"
            }
          )
          data = ActiveSupport::JSON.decode(res)

          break if data["results_returned"] == 0

          # bulk insertする
          tmp_events = []
          data["events"].each do |event|
            tmp_events << TmpEvent.new.tap do |tmp_event|
              event_data = event["event"]
              tmp_event.service_type = Event.service_types[:atnd]
              tmp_event.service_event_id = event_data["event_id"]
              tmp_event.title = event_data["title"]
              # TODO タグとイベントのマッピングテーブルを別途作る
              tmp_event.tag = tag
              tmp_event.started_at =
                Time.parse(event_data["started_at"]).strftime("%Y-%m-%d %H:%M:%S") unless event_data["started_at"].nil?
              tmp_event.ended_at =
                Time.parse(event_data["ended_at"]).strftime("%Y-%m-%d %H:%M:%S") unless event_data["ended_at"].nil?
              tmp_event.place = event_data["address"] + event_data["place"]
              tmp_event.link = event_data["event_url"]
            end
          end

          TmpEvent.import(tmp_events)

          start = start + data["results_returned"]
        end
      end
  end
end
