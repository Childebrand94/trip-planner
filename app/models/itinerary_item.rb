# == Schema Information
#
# Table name: itinerary_items
#
#  id           :integer          not null, primary key
#  creator_id   :integer          not null
#  trip_id      :integer          not null
#  item_type_id :integer          not null
#  event_name   :string           not null
#  address      :string           not null
#  start_time   :datetime         not null
#  end_time     :datetime         not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
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
  validates_comparison_of :start_time, greater_than_or_equal_to: Time.zone.now
end
