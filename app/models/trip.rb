#  == Schema Information
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
class Trip < ApplicationRecord
  has_many :user_trips, dependent: :destroy
  has_many :users, through: :user_trips

  belongs_to :trip_image, class_name: 'TripImage'

  has_many :itinerary_items, dependent: :destroy
  has_many :expenses, dependent: :destroy

  has_many :invites
  has_many :notes

  validates_presence_of :name
  validates_presence_of :location
  validates_presence_of :start_date
  validates_presence_of :end_date
  validates_comparison_of :end_date, greater_than: :start_date
  validates_comparison_of :end_date, greater_than: Date.today

  def itinerary_by_day
    itinerary_items.group_by { |item| item.start_time.to_date }
                   .transform_values { |items| items.sort_by(&:start_time) }
  end
end
