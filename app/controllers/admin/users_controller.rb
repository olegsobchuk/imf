class Admin::UsersController < AdminController
  before_action :require_admin

  def index
    params[:page] ||= 1
    @users = User.all.page(params[:page])
  end

  def show
    @profile = user.profile
    @notification = user.received_notifications.build
  end

  private

  def user
    @user ||= User.joins(:profile).find(params[:id])
  end
end
