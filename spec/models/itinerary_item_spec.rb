# == Schema Information
#
# Table name: itinerary_items
#
#  id           :integer          not null, primary key
#  creator_id   :integer          not null
#  trip_id      :integer          not null
#  item_type_id :integer          not null
#  event_name   :string           not null
#  address      :string           not null
#  start_time   :datetime         not null
#  end_time     :datetime         not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
require 'rails_helper'

# rubocop:disable Metrics/BlockLength
RSpec.describe ItineraryItem, type: :model do
  describe 'validation' do
    subject { build(:itinerary_item) }

    it 'is valid with all attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without a start_time' do
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

    it 'is not valid with start_time and end_time far apart' do
      subject.start_time = '2022-01-10 15:30:00'
      subject.end_time = '2024-01-30 15:30:00'
      expect(subject).to_not be_valid
    end

    it 'is not valid with end_time before start_time' do
      subject.start_time = '2025-01-10 15:30:00'
      subject.end_time = '2024-01-30 15:30:00'
      expect(subject).to_not be_valid
    end

    it 'is not valid with invalid start_time format' do
      subject.start_time = 'not a valid date'
      expect(subject).to_not be_valid
    end
  end
end
# rubocop:enable Metrics/BlockLength
