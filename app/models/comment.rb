class Comment < ApplicationRecord
  belongs_to :users
  belongs_to :itinerary_items
end
