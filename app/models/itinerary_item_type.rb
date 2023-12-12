class ItineraryItemType < ApplicationRecord
  has_many :itinerary_items
  validates_presence_of :name

  def self.names
    pluck(:name)
  end
end
