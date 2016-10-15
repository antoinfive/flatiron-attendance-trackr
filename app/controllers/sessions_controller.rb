class SessionsController < ActionController::Base

  def new
  end

  def create    
    binding.pry
    user = User.find_or_create_from_oauth(request.env["omniauth.auth"])
  end
end


RestClient.post "https://learn.co/oauth/token",
    {client_id: ENV['LEARD_CLIENT_ID', 
     client_secret: ENV['LEARDN_CLIENT_SECRET'] 
     redirect_uri: 'http://localhost:5000/auth/learn/callback',
     grant_type: "authorization_code",
     code: param["code"].to_json, 
    :content_type => :json, :accept => :json
