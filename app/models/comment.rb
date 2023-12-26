class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  belongs_to :itinerary_item, class_name: 'ItineraryItem'

  validates :body, presence: true
end
