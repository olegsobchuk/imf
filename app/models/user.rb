class User < ActiveRecord::Base
  has_secure_password

  validates :email, presence: true, format: { with: /.+@.+\..+/i }
  validates :username, presence: true, on: :update
end
