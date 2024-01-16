# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  confirm_token   :string
#  demo            :boolean          default(FALSE)
#  display_name    :string           not null
#  email           :string           not null
#  email_confirmed :boolean          default(FALSE)
#  first_name      :string           not null
#  last_name       :string           not null
#  password_digest :text             not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
  has_secure_password
  before_create :confirmation_token

  has_many :user_trips, dependent: :destroy

  has_many :trips, through: :user_trips,
                   dependent: :destroy

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

  has_many :authored_notes,
           foreign_key: 'author_id',
           class_name: 'Note',
           dependent: :destroy

  validates :display_name, presence: true

  validates :email, presence: true, uniqueness: true, format: { with: URI::MailTo::EMAIL_REGEXP }
  before_validation :normalize_email

  def voted_on?(itinerary_item)
    itinerary_votes.exists?(itinerary_item_id: itinerary_item.id)
  end

  def email_activate
    self.email_confirmed = true
    self.confirm_token = nil
    save!(validate: false)
  end

  def confirmation_token
    return unless confirm_token.blank?

    self.confirm_token = SecureRandom.urlsafe_base64.to_s
  end

  private

  def normalize_email
    self.email = email.strip.downcase if email.present?
  end
end
