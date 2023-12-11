require 'rails_helper'

# rubocop:disable Metrics/BlockLength
RSpec.describe Trip, type: :model do
  describe 'validation' do
    subject { build(:trip) }

    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without a name' do
      subject.name = nil
      expect(subject).not_to be_valid
    end

    it 'is not valid without a location' do
      subject.location = nil
      expect(subject).not_to be_valid
    end

    it 'is not valid without a start date' do
      subject.start_date = nil
      expect(subject).not_to be_valid
    end

    it 'is not valid without an end date' do
      subject.end_date = nil
      expect(subject).not_to be_valid
    end

    it 'is not vaild with start date before end date' do
      subject.end_date = '2025-01-01'
      subject.start_date = '2025-01-10'
      expect(subject).not_to be_valid
    end

    it 'is not vaild with invaild date' do
      subject.end_date = '2023-01-20'
      subject.start_date = '2023-01-10'
      expect(subject).not_to be_valid
    end
  end

  describe '#itinerary_by_day' do
    let(:trip) { create(:trip, start_date: Date.tomorrow, end_date: Date.tomorrow + 1) }
    let!(:itinerary_item1) do
      create(:itinerary_item, trip:, start_time: Date.tomorrow.noon, end_time: Date.tomorrow.noon + 2.hours)
    end
    let!(:itinerary_item2) do
      create(:itinerary_item, trip:, start_time: (Date.tomorrow + 1).noon,
                              end_time: (Date.tomorrow + 1).noon + 2.hours)
    end

    it 'groups itinerary items by each date of the trip' do
      grouped_items = trip.itinerary_by_day

      expect(grouped_items.keys).to contain_exactly(Date.tomorrow, Date.tomorrow + 1)
      expect(grouped_items[Date.tomorrow]).to contain_exactly(itinerary_item1)
      expect(grouped_items[Date.tomorrow + 1]).to contain_exactly(itinerary_item2)
    end
  end
end
