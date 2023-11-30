class ItineraryItem < ApplicationRecord
  belongs_to :trips
  belongs_to :itinerary_item_types
  has_many :comments
end
