class ItineraryItem < ApplicationRecord
  belongs_to :trip
  belongs_to :type, class_name: 'ItineraryItemType'
  has_many :comments

  validates_presence_of :start_date
  validates_presence_of :end_date
  validates_comparison_of :end_date, greater_than: :start_date
  validates_comparison_of :start_date, greater_than: Date.today
end
