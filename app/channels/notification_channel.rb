# Be sure to restart your server when you modify this file. Action Cable runs in a loop that does not support auto reloading.
class NotificationChannel < ApplicationCable::Channel
  def subscribed
    stream_from "notification_#{current_user.id}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def notify(data, user_id)
    ActionCable.server.broadcast("notification_#{user_id}", notification: data['notification'])
  end
end