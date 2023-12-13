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

  describe 'conflict method' do
    let(:trip) do
      create(:trip, start_date: Date.tomorrow,
                    end_date: Date.tomorrow + 1)
    end
    let!(:item1) do
      create(:itinerary_item, trip:, start_time: Date.tomorrow.noon,
                              end_time: Date.tomorrow.noon + 2.hours)
    end
    let!(:item2) do
      create(:itinerary_item, trip:, start_time: Date.tomorrow.noon + 1.hour,
                              end_time: Date.tomorrow.noon + 2.hours)
    end

    it 'identifies conflicting items' do
      expect(item1.conflicts_with?(item2)).to be_truthy
    end
  end

  describe 'find conflict items' do
    let!(:trip) { create(:trip) }
    let!(:item1) { create(:itinerary_item, trip:, start_time: 1.hour.from_now, end_time: 2.hours.from_now) }
    let!(:item2) { create(:itinerary_item, trip:, start_time: 1.hour.from_now, end_time: 3.hours.from_now) }

    it 'assigns conflicting_item_ids correctly' do
      items = trip.itinerary_by_day
      conflict_ids = items.flat_map { |_, day_items| day_items.select(&:conflict?).map(&:id) }
      expect(conflict_ids).to include(item1.id, item2.id)
    end
  end
end
