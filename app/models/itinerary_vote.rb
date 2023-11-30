class ItineraryVote < ApplicationRecord
  belongs_to :users
  belongs_to :itinerary_items
end
