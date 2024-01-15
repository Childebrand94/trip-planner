# == Schema Information
#
# Table name: itinerary_items
#
#  id           :bigint           not null, primary key
#  address      :string           not null
#  end_time     :datetime         not null
#  event_name   :string           not null
#  start_time   :datetime         not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  creator_id   :bigint           not null
#  item_type_id :bigint           not null
#  trip_id      :bigint           not null
#
# Indexes
#
#  index_itinerary_items_on_creator_id    (creator_id)
#  index_itinerary_items_on_item_type_id  (item_type_id)
#  index_itinerary_items_on_trip_id       (trip_id)
#
# Foreign Keys
#
#  fk_rails_...  (creator_id => users.id)
#  fk_rails_...  (item_type_id => itinerary_item_types.id)
#  fk_rails_...  (trip_id => trips.id)
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
