class UserTrip < ApplicationRecord
  belongs_to :user
  belongs_to :trip
  belongs_to :user_trip_roles
end
