module Adapter
  class LearnApi

    attr_accessor :oauth_token

    def initialize(oauth_token)
      @oauth_token = oauth_token
    end

    def request_header
      {"Authorization" => "Bearer #{self.oauth_token}"}
    end


  end
end

module LearnApi
  class Client

    @@oauth_token = nil
    
    def configure(oauth_token &bloc)
      yield oauth_token
    end
  end
end