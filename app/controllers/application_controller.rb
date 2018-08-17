class ApplicationController < ActionController::Base
  before_action :require_login

  def logged_in?
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  helper_method :logged_in?

  private
  def require_login
    unless logged_in?
      redirect_to login_url, alert: 'You must be logged in to access this section'
    end
  end
end
