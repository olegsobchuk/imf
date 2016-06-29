class User < ApplicationRecord
  has_secure_password

  validates :email, presence: true, format: { with: /.+@.+\..+/i }
  validates :password, length: { in: 6..30 }

  has_one :profile, dependent: :destroy
  has_many :notifications
  has_and_belongs_to_many :companies

  after_create :create_profile

  delegate :full_name, to: :profile
  delegate :location, to: :profile
end
