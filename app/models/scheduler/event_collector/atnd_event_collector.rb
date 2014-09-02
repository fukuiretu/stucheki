class Scheduler
  class EventCollector
    class AtndEventCollector
      include Common

      def collect
        print "collect called."

        # TODO 条件
        # http://api.atnd.org/events/?keyword_or=google,cloud&format=atom

        res = call_for_get(
          Settings.endpoint[:atnd],
          "/events",
          {
            keyword_or: "ruby",
            ym: "201409",
            format: "json"
          }
        )
      end
    end
  end
end
