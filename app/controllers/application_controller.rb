# frozen_string_literal: true

class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  private

  def authenticate_user!
    redirect_to logins_path unless current_user
  end

  def current_user
    session[:user_id]
  end
  helper_method :current_user
end
