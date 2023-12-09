require 'rails_helper'

# rubocop:disable Metrics/BlockLength
RSpec.describe ItineraryItem, type: :model do
  describe 'validation' do
    subject { build(:itinerary_item) }

    it 'is valid with all attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without start_date' do
      subject.start_date = ''
      expect(subject).to_not be_valid
    end

    it 'is not valid without a type' do
      subject.type_id = -1
      expect(subject).to_not be_valid
    end

    it 'is not valid without end_date' do
      subject.end_date = ''
      expect(subject).to_not be_valid
    end

    it 'is not valid with invalid date' do
      subject.start_date = '20220110 15:30:00'
      subject.end_date = '20240130 15:30:00'
      expect(subject).to_not be_valid
    end

    it 'is not valid with end_date before start_date' do
      subject.start_date = '20250110 15:30:00'
      subject.end_date = '20240130 15:30:00'
      expect(subject).to_not be_valid
    end

    it 'is not valid with invalid foramt' do
      subject.start_date = 'not a vaild date'
      expect(subject).to_not be_valid
    end
  end
end
