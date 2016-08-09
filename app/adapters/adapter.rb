require 'rest-client'

module Adapter
  class LearnAPI
    class Client
      attr_reader :oauth_token

      def initialize(oauth_token)
        @oauth_token = oauth_token
      end

      def fetch_students(batch_id)
        RestClient.get("http://learn.co/api/batches/#{batch_id}/users", request_header)
      end

      def request_header
        {"Authorization" => "Bearer #{oauth_token}"}
      end

    end
  end
end
