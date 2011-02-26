class AuthenticationsController < ApplicationController
  def index
    @authentications = current_user.authentications if current_user
  end

  def create
    auth = request.env["omniauth.auth"]

    unless auth 
        redirect_to authentications_url
        flash[:notice] = "Could not authenticate via #{params['provider']}"
    end

    authentication = Authentication.find_by_provider_and_uid(auth['provider'], auth['uid'])

    if authentication
        flash[:notice] = "Signed in successfully."  
        sign_in_and_redirect(:user, authentication.user)  
    elsif current_user
        current_user.authentications.create!(:provider => auth['provider'],
            :uid => auth['uid'],
            :token => auth['credentials']['token'],
            :secret => auth['credentials']['secret'])
        flash[:notice] = "Authentication successful."  
        redirect_to authentications_url
    else
        user = User.new
        user.apply_omniauth(auth)
        
        if user.save
            flash[:notice] = "Signed in successfully."
            sign_in_and_redirect(:user, user)
        else
            session[:omniauth] = auth.except('extra')
            redirect_to new_user_registration_url
        end
    end

    # current_user.authentications.find_or_create_by_provider_and_uid(auth['provider'], auth['uid'])
    # flash[:notice] = "Authentication successful!"
    # redirect_to authentications_url
  end

  def destroy
    @authentication = current_user.authentications.find(params[:id])
    @authentication.destroy
    flash[:notice] = "Successfully destroyed authentication."
    redirect_to authentications_url
  end
end
