class Profile < ApplicationRecord
  attr_accessor :avatar

  belongs_to :user

  validates :avatar, file_content_type: { allow: %r{^image\/.*} }

  after_validation :upload_avatar

  def full_name
    "#{first_name} #{last_name}".strip
  end

  private

  def upload_avatar
    self.avatar_id = FlickrService.upload(user, avatar) if avatar && !avatar_id
  end
end
