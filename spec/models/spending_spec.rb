require 'rails_helper'

RSpec.describe Spending, type: :model do
  describe 'validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:amount) }
    it { is_expected.to validate_numericality_of(:amount) }
    it { is_expected.to validate_presence_of(:category) }
  end
  describe 'associations' do
    it { should belong_to(:user) }
  end
end
