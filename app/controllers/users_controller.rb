class UsersController < ApplicationController
  before_action :require_user

  def show
    @profile_decorator = ProfileDecorator.new(current_user.profile)
    @notifications_count = current_user.received_notifications.count
  end
end
