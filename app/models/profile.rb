class Profile < ActiveRecord::Base
  validates :first_name, :second_name, presence: true

  belongs_to :user
end
