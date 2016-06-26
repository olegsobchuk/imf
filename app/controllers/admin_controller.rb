class AdminController < ActionController::Base
  protect_from_forgery with: :exception

  protected

  def current_admin
    @current_admin ||= Admin.find(session[:admin_id]) if session[:admin_id]
  rescue ActiveRecord::RecordNotFound
    reset_session
  end
  helper_method :current_admin

  def require_user
    redirect_to new_session_path unless current_admin
  end
end
