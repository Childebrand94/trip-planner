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
class ItineraryItem < ApplicationRecord
  belongs_to :trip
  belongs_to :creator, class_name: 'User', foreign_key: 'creator_id'
  belongs_to :item_type, class_name: 'ItineraryItemType'
  has_many :comments, class_name: 'Comment', dependent: :destroy
  has_many :itinerary_votes, class_name: 'ItineraryVote', dependent: :destroy

  validates_presence_of :start_time
  validates_presence_of :end_time
  validates_comparison_of :end_time, greater_than: :start_time
end
