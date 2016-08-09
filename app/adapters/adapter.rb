require 'rest-client'

module Adapter
  class LearnAPI
    class Client

      def initialize(token)
        @token = token
      end

      def fetch_students(batch_id)
        #url = "http://learn.co/api/batches/:id/users"
        RestClient.get("http://learn.co/api")

      end


    end
  end
end
