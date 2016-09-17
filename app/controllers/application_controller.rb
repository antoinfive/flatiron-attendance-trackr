class ApplicationController < ActionController::API
  # helper_method :current_user, :logged_in?

  def current_user
    @current_user ||= User.find(session[:id]) if session[:id]
  end


end
