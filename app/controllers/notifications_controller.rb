class SessionsController < ApplicationController
  before_action :notifications

  def index
  end

  def show
    @notification = notifications.find(params[:id])
  end

  def create
    @notification = notifications.build(notification_params)
    @notification.valid? && @notification.save
  end

  private

  def notification_params
    params.require(:notification).permit(:content)
  end

  def notifications
    @notifications ||= current_user.notifications
  end
end
