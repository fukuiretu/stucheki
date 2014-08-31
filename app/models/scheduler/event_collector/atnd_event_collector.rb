class Scheduler
  class EventCollector
    class AtndEventCollector
      include Common

      def collect
        print "collect called."
      end
    end
  end
end
