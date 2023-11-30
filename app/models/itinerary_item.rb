class ItineraryItem < ApplicationRecord
  belongs_to :trips
  has_many :itinerary_items
end
