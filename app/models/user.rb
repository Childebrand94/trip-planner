class User < ApplicationRecord
  has_secure_password

  has_many :user_trips, dependent: :destroy
  has_many :trips, through: :user_trips

  has_many :created_itinerary_items,
           foreign_key: 'creator_id',
           class_name: 'ItineraryItem',
           dependent: :destroy
  has_many :itinerary_votes, dependent: :destroy
  has_many :authored_comments,
           foreign_key: 'author_id',
           class_name: 'Comment',
           dependent: :destroy

  has_many :debtors, dependent: :destroy
  has_many :expenses,
           foreign_key: 'payer_id',
           class_name: 'Expense',
           dependent: :destroy

  has_many :debtor_expenses,
           through: :debtors,
           source: :expense

  has_many :received_invitations,
           class_name: 'Invite',
           foreign_key: 'recipient_id',
           dependent: :destroy
  has_many :sent_invites,
           class_name: 'Invite',
           foreign_key: 'sender_id',
           dependent: :destroy

  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  before_validation :normalize_email

  def voted_on?(itinerary_item)
    itinerary_votes.exists?(itinerary_item_id: itinerary_item.id)
  end

  private

  def normalize_email
    self.email = email.strip.downcase if email.present?
  end
end
