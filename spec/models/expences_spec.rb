require 'rails_helper'

RSpec.describe Expense, type: :model do
  describe 'validation' do
    subject { build(:expense) }

    it 'is valid with all attributes' do
      expect(subject).to be_valid
    end

    it 'is valid with no itinerary item key' do
      subject.itinerary_item_id = nil
      expect(subject).to be_valid
    end
  end
end
