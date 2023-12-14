require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'validation' do
    let(:itinerary_item) { create(:itinerary_item) }
    subject { build(:comment, itinerary_item:) }

    it 'is valid with all attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without a body' do
      subject.body = ''
      expect(subject).not_to be_valid
    end
  end
end
