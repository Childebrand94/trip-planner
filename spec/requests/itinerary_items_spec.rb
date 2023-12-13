require 'rails_helper'

RSpec.describe 'ItineraryItems', type: :request do
  describe 'GET /index' do
    let!(:trip) { create(:trip) }
    let!(:item1) { create(:itinerary_item, trip:, start_time: 1.hour.from_now, end_time: 2.hours.from_now) }
    let!(:item3) { create(:itinerary_item, trip:, start_time: 1.hour.from_now, end_time: 3.hours.from_now) }

    before do
      get trip_itinerary_item_path(trip)
    end

    it 'assigns @conflicting_item_ids correctly' do
      expect(assigns(:conflicting_item_ids)).to include(item1.id, item2.id)
    end
  end
end
