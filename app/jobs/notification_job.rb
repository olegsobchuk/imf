class NotificationJob < ApplicationJob
  queue_as :default

  def perform(notification)
    receiver_id = notification.receiver_id
    content = notification.content

    ActionCable.server.broadcast("notification_#{receiver_id}", notification: content)
  end
end
