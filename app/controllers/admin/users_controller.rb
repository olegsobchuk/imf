class Admin::UsersController < AdminController
  before_action :require_admin

  def index
    params[:page] ||= 1
    @users = User.all.page(params[:page])
  end

  def show
    @profile = user.profile
  end

  private

  def user
    @user ||= User.joins(:profile).find(params[:id])
  end
end
