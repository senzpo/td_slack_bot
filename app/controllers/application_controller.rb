# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :cors_set_access_control_headers

  # For all responses in this controller, return the CORS access control headers.

  private

  def cors_set_access_control_headers
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS'
    headers['Access-Control-Allow-Headers'] = '*'
    headers['Access-Control-Max-Age'] = "1728000"
  end

  def authenticate_user!
    unless current_user?
      redirect_to logins_path
    end
  end

  def current_user?
    begin
      stored_hashed_user_id = BCrypt::Password.new(session[:hashed_user_id])
      stored_hashed_user_id == session[:user_id]
    rescue BCrypt::Errors::InvalidHash
      false
    end
  end
  helper_method :current_user?
end
