class Invite < ApplicationRecord
  belongs_to :trip
  belongs_to :sender, class_name: 'User'
  belongs_to :recipient, class_name: 'User', optional: true

  before_create :generate_token
  before_save :check_user_existence
  validates :email, presence: true

  def check_user_existence
    user = User.find_by_email(email)
    self.recipient_id = user.id if user.present?
  end

  def generate_token
    self.token = SecureRandom.uuid
  end
end
