class User < ActiveRecord::Base
  has_secure_password

  validates :email, presence: true, format: { with: /.+@.+\..+/i }
  validates :password, length: { in: 6..30 }

  has_one :profile
  has_and_belongs_to_many :companies

  after_create :create_profile
end
