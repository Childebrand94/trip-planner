# == Schema Information
#
# Table name: trip_images
#
#  id         :bigint           not null, primary key
#  path       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class TripImage < ApplicationRecord
  has_many :trips
end
