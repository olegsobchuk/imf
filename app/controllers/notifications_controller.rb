class NotificationsController < ApplicationController
  def index
  end

  def create
    @notification = Notification.new(notification_params)
    @notification.valid? && @notification.save
  end

  private

  def notification_params
    params.require(:notification).permit(:receiver_id, :sender_id, :content)
  end
end
