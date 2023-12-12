class ItineraryItem < ApplicationRecord
  belongs_to :trip
  belongs_to :creator, class_name: 'User', foreign_key: 'creator_id'
  belongs_to :item_type, class_name: 'ItineraryItemType'
  has_many :comments

  validates_presence_of :start_time
  validates_presence_of :end_time
  validates_comparison_of :end_time, greater_than: :start_time
  validates_comparison_of :start_time, greater_than_or_equal_to: Time.zone.now

  def item_types
    ItineraryItemType.pluck(:name)
  end
end
