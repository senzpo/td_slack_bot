module Web
  class LoginsController < ApplicationController
    skip_before_action :authenticate_user!
    def index; end

    def create
      user_id = authenticate_with_google
      if user_id
        session[:user_id] = user_id
        redirect_to root_path
      else
        redirect_to logins_path, alert: 'authentication_failed'
      end
    end

    private
    def authenticate_with_google
      id_token = flash[:google_sign_in]['id_token']
      error = flash[:google_sign_in]['error']
      if id_token
        GoogleSignIn::Identity.new(id_token).user_id
      elsif error
        logger.error "Google authentication error: #{error}"
        nil
      end
    end
  end
end