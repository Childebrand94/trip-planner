class ItineraryVote < ApplicationRecord
  belongs_to :user
  belongs_to :itinerary_item

  scope :up_vote_total, -> { where(up_vote: true) }
  scope :down_vote_total, -> { where(up_vote: false) }

  validates :user_id, uniqueness: { scope: :itinerary_item_id }
end
