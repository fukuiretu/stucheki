class EventCrawler
  class CompassEventCrawler
    include Common

    def collect
      print "collect called."

      # TODO 条件
      # http://connpass.com/api/v1/event/?keyword=python

      res = call_for_get(
        Settings.endpoint[:compass],
        "/event",
        {
          keyword: "ruby"
        }
      )
    end
  end
end
