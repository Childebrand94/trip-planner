class Trip < ApplicationRecord
  belongs_to :creator, class_name: 'User', foreign_key: 'creator_id'
  has_many :user_trips
  has_many :users, through: :user_trips
  has_many :itinerary_items
  has_many :expenses
end
