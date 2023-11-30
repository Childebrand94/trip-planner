class User < ApplicationRecord
  has_many :trips
  has_many :user_trips
  has_many :itinerary_votes
  has_many :expenses
  has_many :comments
  has_many :comment_votes
  has_many :debtors
end
