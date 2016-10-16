class SessionsController < ActionController::Base

  def new
  end

  def create    
    current_user_payload = LearnApiAuthorizer.new(params[:code]).fetch_current_user_payload
    user = User.find_or_create_from_oauth(current_user_payload)
    redirect_to 'http://localhost:3000/login?jwt=testingJWT'
    # render json: {jwt: "HI"}
    # RestClient.post('http://localhost:3000/login', {jwt: "THIS WILL BE A TOKEN one day..."}.to_json, {content_type: :json, accept: :json})
    # RestClient.get('http://localhost:3000')
    # RestClient.post('http://localhost:3000/login', {jwt: "THIS WILL BE A TOKEN one day..."}.to_json, {content_type: :json, accept: :json})
    
    # return head :no_content
    #  post to REact from here?!?!?!?!?!?!??!?!?!?!?!?!?
  end
end


