class LearnApiAuthorizer

  def initialize(code)
    @authorizer = Adapter::LearnApi::Authorizer.new(code)
  end

  def fetch_current_user_payload
    token = @authorizer.fetch_token
    Adapter::LearnApi::Client.new(token).fetch_current_user
  end


end