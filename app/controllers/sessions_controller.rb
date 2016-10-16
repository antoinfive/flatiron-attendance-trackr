class SessionsController < ActionController::Base

  def new
  end

  def create    
    current_user_payload = LearnApiAuthorizer.new(params[:code]).fetch_current_user_payload
    user = User.find_or_create_from_oauth(current_user_payload)
    redirect_to 'http://localhost:3000/finishLogin?jwt=testingJWT'
  end
end


