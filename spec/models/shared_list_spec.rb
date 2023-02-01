require 'rails_helper'

RSpec.describe SharedList, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:viewer_id) }
    it { is_expected.to validate_presence_of(:owner_id) }
  end
  describe 'associations' do
    it { should belong_to(:owner) }
    it { should belong_to(:viewer) }
  end
end
