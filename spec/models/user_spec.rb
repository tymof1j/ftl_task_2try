require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
  end
  describe 'associations' do
    it { should have_many(:spendings) }
    it { should have_many(:viewers) }
    it { should have_one(:owner) }
  end
end
