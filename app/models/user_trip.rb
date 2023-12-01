class UserTrip < ApplicationRecord
  belongs_to :user
  belongs_to :trip
  belongs_to :user_trip_role, class_name: 'UserTripRole', foreign_key: 'user_role'
end
