class Trip < ApplicationRecord
  belongs_to :user, foreign_key: 'creator_id'
  has_many :user_trips
  has_many :itinerary_items
  has_many :expenses
end
