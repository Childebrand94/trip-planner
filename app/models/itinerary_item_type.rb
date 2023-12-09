class ItineraryItemType < ApplicationRecord
  has_many :itinerary_items
  validates_presence_of :name
  validates_uniqueness_of :name
end
