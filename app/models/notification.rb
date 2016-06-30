class Notification < ApplicationRecord
  validates :content, presence: true

  belongs_to :receiver, class_name: User
  belongs_to :sender, class_name: Admin

  after_commit :send_notification

  private

  def send_notification
    # build job what will send notification
  end
end
