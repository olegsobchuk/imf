class Session < VirtualModel
  attr_accessor :email, :password

  delegate :id, to: :user, prefix: true
  delegate :type, to: :user, prefix: true

  validates :email, :password, presence: true
  validate :credentials, unless: -> { password.blank? }

  def user
    @user ||= User.find_by_email(email.downcase)
  end

  private

  def credentials
    errors.add(:email, :invalid) && return if user.nil?
    errors.add(:password, :pending) if user.password_digest.nil?
    errors.add(:email, :invalid) unless user.authenticate(password)
  end
end
