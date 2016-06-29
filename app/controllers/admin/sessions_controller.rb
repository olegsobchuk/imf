class Admin::SessionsController < AdminController
  def create
    if admin && admin.authenticate(params[:password])
      session[:admin_id] = admin.id
      redirect_to admin_users_path
    else
      render :new
    end
  end

  def destroy
    reset_session
    redirect_to new_admin_session_path
  end

  private

  def admin
    @admin ||= Admin.find_by(email: params[:email])
  end
end
