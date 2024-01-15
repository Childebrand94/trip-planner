# == Schema Information
#
# Table name: trips
#
#  id            :bigint           not null, primary key
#  end_date      :date             not null
#  latitude      :decimal(10, 6)
#  location      :string           not null
#  longitude     :decimal(10, 6)
#  name          :string           not null
#  start_date    :date             not null
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  trip_image_id :bigint           not null
#
# Indexes
#
#  index_trips_on_trip_image_id  (trip_image_id)
#
# Foreign Keys
#
#  fk_rails_...  (trip_image_id => trip_images.id)
#
FactoryBot.define do
  factory :trip do
    sequence(:name) { |n| "Trip name #{n}" }
    location { 'Las Vegas' }
    start_date { '2025-01-01' }
    end_date { '2025-01-10' }
  end
end
