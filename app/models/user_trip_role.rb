# == Schema Information
#
# Table name: user_trip_roles
#
#  id         :integer          not null, primary key
#  role       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class UserTripRole < ApplicationRecord
  has_many :user_trips
end
