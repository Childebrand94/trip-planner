class ItineraryItem < ApplicationRecord
  belongs_to :trip_day
  belongs_to :item_type, class_name: 'ItineraryItemType'
  has_many :comments

  validates_presence_of :start_time
  validates_presence_of :end_time
  validates_comparison_of :end_time, greater_than: :start_time
  validates_comparison_of :start_time, greater_than: Date.today
end
