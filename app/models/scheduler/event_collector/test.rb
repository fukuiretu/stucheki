class Scheduler
  class EventCollector
    class Test
      include Common

      def self.hoge
        print "testtest"
        exec( "echo 'hi' >> /tmp/whenevertest.log" )
      end
    end
  end
end
