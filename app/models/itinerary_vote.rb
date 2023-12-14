class ItineraryVote < ApplicationRecord
  belongs_to :user
  belongs_to :itinerary_item

  validates_presence_of :up_vote
end
