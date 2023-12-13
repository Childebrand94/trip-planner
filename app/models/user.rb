class User < ApplicationRecord
  has_many :trips, foreign_key: 'creator_id', class_name: 'Trip'
  has_many :user_trips, foreign_key: 'user_id', class_name: 'user_trip'
  has_many :itinerary_items, foreign_key: 'creator_id', class_name: 'ItineraryItem'
  has_many :itinerary_votes
  has_many :expenses
  has_many :comments, foreign_key: 'author_id'
  has_many :debtors

  has_secure_password

  validates_presence_of :email
  normalizes :email, with: ->(email) { email.strip.downcase }
  validates_uniqueness_of :email
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }
end
