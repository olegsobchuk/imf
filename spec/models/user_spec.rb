require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'password' do
    it { is_expected.to have_secure_password }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of(:email) }
    it { is_expected.to validate_presence_of(:password) }
    it { is_expected.to validate_length_of(:password).is_at_least(6).is_at_most(30) }
  end

  describe 'associations' do
    it { is_expected.to have_one(:profile) }
    it { is_expected.to have_many(:notifications) }
    it { is_expected.to have_and_belong_to_many(:companies) }
  end

  describe 'callbacks' do
    context 'create_profile' do
      around do |example|
        User.set_callback(:create, :after, :create_profile)
        example.run
        User.skip_callback(:create, :after, :create_profile)
      end
      let(:user) { build(:user) }

      it { expect { user.save }.to change { user.profile }.from(nil) }
    end
  end

  describe 'delegates' do
    let(:user) { create(:user_with_profile) }
    let(:profile) { user.profile }

    context '#full_name' do
      it { expect(user.full_name).to eq(profile.full_name) }
    end

    context '#location' do
      it { expect(user.location).to eq(profile.location) }
    end
  end
end
