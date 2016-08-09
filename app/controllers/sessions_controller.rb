class SessionsController < ActionController::Base

  def new

  end

  def create
    binding.pry
    user = User.find_or_create_from_oauth(request.env["omniauth.auth"])
  end
end
