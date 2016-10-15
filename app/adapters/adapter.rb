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

      def request_token(code)
        RestClient.post "https://learn.co/oauth/token", {
          client_id: ENV['LEARD_CLIENT_ID', 
          client_secret: ENV['LEARDN_CLIENT_SECRET'],
          redirect_uri: 'http://localhost:5000/auth/learn/callback',
          grant_type: "authorization_code",
          code: code.to_json, 
         :content_type => :json, :accept => :json
        }

      end
    end
  end
end
