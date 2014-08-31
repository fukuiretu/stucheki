require "scheduler/event_collector/common"
require "scheduler/event_collector/atnd_event_collector"

class Scheduler
  class EventCollector
    def self.create(service_name)
      Object.const_get("Scheduler::EventCollector::#{service_name.capitalize}EventCollector").new()
    end
  end
end
