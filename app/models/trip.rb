class Trip < ApplicationRecord
  belongs_to :creator, class_name: 'User', foreign_key: 'creator_id'
  has_many :user_trips
  has_many :users, through: :user_trips
  has_many :itinerary_items
  has_many :expenses

  validates_presence_of :name
  validates_presence_of :location
  validates_presence_of :starting_date
  validates_presence_of :ending_date
  validates_comparison_of :ending_date, greater_than: :starting_date
  validates_comparison_of :starting_date, greater_than: Date.today
end
