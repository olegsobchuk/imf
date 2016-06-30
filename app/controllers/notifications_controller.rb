class NotificationsController < ApplicationController
  def index
  end

  def create
    @notification = Notification.build(notification_params)
    @notification.valid? && @notification.save
  end

  private

  def notification_params
    params.require(:notification).permit(:content)
  end
end
