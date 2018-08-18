class ApplicationController < ActionController::Base
  before_action :require_login

  def logged_in?
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def current_user
    @current_user
  end

  helper_method :logged_in?, :current_user

  private
  def require_login
    unless logged_in?
      redirect_to login_url, alert: 'You must be logged in to access this section!'
    end
  end

  def require_admin
    unless @current_user.admin?
      redirect_to root_url, alert: 'You must be admin user to access this section!'
    end
  end
end
