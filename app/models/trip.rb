class Trip < ApplicationRecord
  before_save :camelize_location
  belongs_to :creator, class_name: 'User', foreign_key: 'creator_id'
  has_many :user_trips
  has_many :users, through: :user_trips
  has_many :itinerary_items
  has_many :expenses

  private

  def camelize_location
    self.location = location.camelize if location.is_a?(String)
  end
end
