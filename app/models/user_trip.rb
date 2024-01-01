class UserTrip < ApplicationRecord
  belongs_to :user
  belongs_to :trip
  belongs_to :user_trip_role

  delegate :role, to: :user_trip_role, allow_nil: true
  validates :user_id, uniqueness:
    { scope: :trip_id, message: 'has already been invited to this trip' }
end
