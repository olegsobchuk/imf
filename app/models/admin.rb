class Admin < ApplicationRecord
  has_secure_password

  validates :email, presence: true, format: { with: /.+@.+\..+/i }
  validates :password, length: { in: 6..30 }
end
