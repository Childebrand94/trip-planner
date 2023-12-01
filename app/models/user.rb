class User < ApplicationRecord
  has_many :trips, foreign_key: 'creator_id', class_name: 'Trip'
  has_many :user_trips, foreign_key: 'user_id'
  has_many :itinerary_votes
  has_many :expenses
  has_many :comments
  has_many :debtors

  has_secure_password
end
