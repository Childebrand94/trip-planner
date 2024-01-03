# == Schema Information
#
# Table name: itinerary_votes
#
#  id                :integer          not null, primary key
#  itinerary_item_id :integer          not null
#  user_id           :integer          not null
#  up_vote           :boolean          not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
class ItineraryVote < ApplicationRecord
  belongs_to :user
  belongs_to :itinerary_item

  scope :up_vote_total, -> { where(up_vote: true) }
  scope :down_vote_total, -> { where(up_vote: false) }

  validates :user_id, uniqueness: { scope: :itinerary_item_id }
end
