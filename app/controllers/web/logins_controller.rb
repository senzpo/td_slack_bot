module Web
  class LoginsController < ApplicationController
    skip_before_action :authenticate_user!
    def index; end

    def create
      if user_id = authenticate_with_google
        hashed_user_id = BCrypt::Password.create(user_id)
        session[:hashed_user_id] = hashed_user_id
        session[:user_id] = user_id
        redirect_to root_path
      else
        redirect_to logins_path, alert: 'authentication_failed'
      end
    end

    private
    def authenticate_with_google
      if id_token = flash[:google_sign_in]['id_token']
        GoogleSignIn::Identity.new(id_token).user_id
      elsif error = flash[:google_sign_in]['error']
        logger.error "Google authentication error: #{error}"
        nil
      end
    end
  end
end