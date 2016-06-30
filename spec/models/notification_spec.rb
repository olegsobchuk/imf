require 'rails_helper'

RSpec.describe Notification, type: :model do
  describe 'validates' do
    it { is_expected.to validate_presence_of(:content) }
  end

  describe 'associations' do
    it { is_expected.to belong_to(:receiver) }
    it { is_expected.to belong_to(:sender) }
  end
end
