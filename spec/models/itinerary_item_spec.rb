require 'rails_helper'

# rubocop:disable Metrics/BlockLength
RSpec.describe ItineraryItem, type: :model do
  describe 'validation' do
    subject { build(:itinerary_item) }

    it 'is valid with all attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without start_time' do
      subject.start_time = ''
      expect(subject).to_not be_valid
    end

    it 'is not valid without a type' do
      subject.item_type_id = -1
      expect(subject).to_not be_valid
    end

    it 'is not valid without end_time' do
      subject.end_time = ''
      expect(subject).to_not be_valid
    end

    it 'is not valid with invalid time' do
      subject.start_time = '20220110 15:30:00'
      subject.end_time = '20240130 15:30:00'
      expect(subject).to_not be_valid
    end

    it 'is not valid with end_time before start_date' do
      subject.start_time = '20250110 15:30:00'
      subject.end_time = '20240130 15:30:00'
      expect(subject).to_not be_valid
    end

    it 'is not valid with invalid foramt' do
      subject.start_time = 'not a vaild date'
      expect(subject).to_not be_valid
    end
  end
end
