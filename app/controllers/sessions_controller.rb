class SessionsController < ActionController::Base

  def new
  end

  def create     
    user = User.find_or_create_from_oauth(request.env["omniauth.auth"])
  end
end
