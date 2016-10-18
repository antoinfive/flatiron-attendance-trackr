require 'rest-client'

module Adapter
  class LearnApi

    class Client
      BASE_URL = "http://learn.co/api"
      attr_reader :oauth_token

      def initialize(oauth_token)
        @oauth_token = oauth_token
      end

      def fetch_students(batch_id)
        RestClient.get("#{BASE_URL}/batches/#{batch_id}/users", request_header)
      end

      def request_header
        {"Authorization" => "Bearer #{oauth_token}"}
      end

      def fetch_current_user
        response = RestClient.get("#{BASE_URL}/users/me", request_header)
        JSON.parse(response.body)
      end

    end

    class Authorizer
      def initialize(auth_code)
        @code = auth_code
      end

      def fetch_token
        # "Content-Type: application/json" -X POST -d '{"client_id":"0618d1cfd3af7231504179389412d85a6981781151f66c910bea0bfd73e54f93","client_secret":cc74f6a1f018e7ef74d08474d34ce47916417db6ce619293e51b27c819ded368, "redirect_uri": "http://localhost:5000/auth/learn/callback", "grant_type": "authorization_code", "authorization_code": "3b4bdddf4ee8056597899cbc1c3f3b4772aa170ef66d28e9cbf15fff4bade12f"}
       response = RestClient.post "https://learn.co/oauth/token", {
          client_id: ENV['LEARN_CLIENT_ID'], 
          client_secret: ENV['LEARN_CLIENT_SECRET'], 
          redirect_uri: 'http://localhost:5000/auth/learn/callback',
          grant_type: "authorization_code",
          code: @code}.to_json, 
          :content_type => :json, :accept => :json
        JSON.parse(response.body)["access_token"]
      end
    end
  end
end
