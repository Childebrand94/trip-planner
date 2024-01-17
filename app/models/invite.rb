# == Schema Information
#
# Table name: invites
#
#  id           :bigint           not null, primary key
#  email        :string           not null
#  token        :string           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  recipient_id :integer
#  sender_id    :integer          not null
#  trip_id      :integer          not null
#
class Invite < ApplicationRecord
  belongs_to :trip
  belongs_to :sender, class_name: 'User'
  belongs_to :recipient, class_name: 'User', optional: true

  before_create :generate_token
  before_validation :check_recipient_existence, on: :create
  validates :email, presence: true

  def check_recipient_existence
    user = User.find_by_email(email)
    return unless user.present?

    self.recipient_id = user.id
    check_recipient_in_trip(user)
  end

  def check_recipient_in_trip(user)
    user_trip = UserTrip.find_by(trip_id:, user_id: user.id)
    return unless user_trip

    errors.add(:base, 'User is already in this trip')
  end

  def generate_token
    self.token = SecureRandom.uuid
  end
end
