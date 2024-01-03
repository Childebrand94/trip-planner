# == Schema Information
#
# Table name: itinerary_item_types
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class ItineraryItemType < ApplicationRecord
  has_many :itinerary_items
  validates_presence_of :name

  def self.names
    pluck(:name)
  end
end
