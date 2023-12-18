class User < ApplicationRecord
  has_many :user_trips
  has_many :trips, through: :user_trips

  has_many :itinerary_items, foreign_key: 'creator_id', class_name: 'ItineraryItem'
  has_many :itinerary_votes
  has_many :expenses
  has_many :comments, foreign_key: 'author_id'
  has_many :debtors

  validates :password, length: { minimum: 8 }
  has_secure_password

  validates_presence_of :email
  normalizes :email, with: ->(email) { email.strip.downcase }
  validates_uniqueness_of :email
  validates :email, format: { with: URI::MailTo::EMAIL_REGEXP }

  def voted_on?(itinerary_item)
    itinerary_votes.exists?(itinerary_item_id: itinerary_item.id)
  end
end
