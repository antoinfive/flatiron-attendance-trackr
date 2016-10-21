class SessionsController < ApplicationController 
  skip_before_action :authenticate

  def create    
    current_user_payload = LearnApiAuthorizer.new(params[:code]).fetch_current_user_payload
    user = User.find_or_create_from_oauth(current_user_payload)

    if user 
      jwt = Auth.issue({user: user.id})
    end
    redirect_to "http://localhost:3000/finishLogin?jwt=#{jwt}"
  end
end


