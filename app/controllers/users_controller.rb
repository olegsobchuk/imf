class UsersController < ApplicationController
  before_action :require_user

  def show
    @profile = current_user.profile
    @notifications_count = current_user.notifications.count
  end
end
