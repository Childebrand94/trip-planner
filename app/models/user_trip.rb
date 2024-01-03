# == Schema Information
#
# Table name: user_trips
#
#  id                :integer          not null, primary key
#  user_id           :integer          not null
#  trip_id           :integer          not null
#  user_trip_role_id :integer          not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
class UserTrip < ApplicationRecord
  belongs_to :user
  belongs_to :trip
  belongs_to :user_trip_role

  delegate :role, to: :user_trip_role, allow_nil: true
  validates :user_id, uniqueness:
    { scope: :trip_id, message: 'has already been invited to this trip' }
end
