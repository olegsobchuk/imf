class Notification < ApplicationRecord
  validates :content, presence: true

  belongs_to :receiver, class_name: User
  belongs_to :sender, class_name: Admin

  after_commit :send_notification

  private

  def send_notification
    NotificationJob.perform_later(self)
  end
end
