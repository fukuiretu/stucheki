require "faraday"
require "time"

class Scheduler
  class EventCollector
    module Common
      # common method
      def call_for_get(endpoint, url, params = {})
        @conn ||= Faraday.new(:url => endpoint) do |faraday|
          faraday.request  :url_encoded
          faraday.response :logger
          faraday.adapter  Faraday.default_adapter
        end

        response = @conn.get do |req|
          req.url url
          params.each do |k, v|
            req.params[k] = v
          end
        end

        response.body
      end

      # imprements method
      def execute()
        raise NotImplementedError
      end
    end
  end
end
