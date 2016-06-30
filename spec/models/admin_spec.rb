require 'rails_helper'

RSpec.describe Admin, type: :model do
  describe 'password' do
    it { is_expected.to have_secure_password }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:password) }
    it { is_expected.to validate_length_of(:password).is_at_least(6).is_at_most(30) }
  end

  describe 'associations' do
    it { is_expected.to have_many(:sent_notifications) }
  end
end
