class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  protected

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  rescue ActiveRecord::RecordNotFound
    reset_session
  end
  helper_method :current_user

  def require_user
    redirect_to new_session_path unless current_user
  end
end
