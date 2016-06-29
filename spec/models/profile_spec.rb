require 'rails_helper'

RSpec.describe Profile, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:user) }
  end

  describe '#fill_name' do
    context 'only first_name' do
      let(:profile) { build(:profile, last_name: nil) }

      it { expect(profile.full_name).to eq(profile.first_name) }
    end

    context 'only last_name' do
      let(:profile) { build(:profile, first_name: nil) }

      it { expect(profile.full_name).to eq(profile.last_name) }
    end

    context 'not filled in names' do
      let(:profile) { build(:profile, first_name: nil, last_name: nil) }

      it { expect(profile.full_name).to eq('') }
    end

    context 'with both names' do
      let(:profile) { build(:profile) }
      let(:result) { profile.first_name + ' ' + profile.last_name }

      it { expect(profile.full_name).to eq(result) }
    end
  end
end
