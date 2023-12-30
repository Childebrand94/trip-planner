class UserTrip < ApplicationRecord
  belongs_to :user
  belongs_to :trip
  belongs_to :user_trip_role

  delegate :role, to: :user_trip_role, allow_nil: true
end
