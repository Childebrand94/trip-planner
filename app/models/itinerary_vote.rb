# == Schema Information
#
# Table name: itinerary_votes
#
#  id                :bigint           not null, primary key
#  up_vote           :boolean          not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  itinerary_item_id :bigint           not null
#  user_id           :bigint           not null
#
# Indexes
#
#  index_itinerary_votes_on_itinerary_item_id  (itinerary_item_id)
#  index_itinerary_votes_on_user_id            (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (itinerary_item_id => itinerary_items.id)
#  fk_rails_...  (user_id => users.id)
#
class ItineraryVote < ApplicationRecord
  belongs_to :user
  belongs_to :itinerary_item

  scope :up_vote_total, -> { where(up_vote: true) }
  scope :down_vote_total, -> { where(up_vote: false) }

  validates :user_id, uniqueness: { scope: :itinerary_item_id }
end
