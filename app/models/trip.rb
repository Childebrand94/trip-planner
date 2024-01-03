# == Schema Information
#
# Table name: trips
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  location   :string           not null
#  start_date :date             not null
#  end_date   :date             not null
#  latitude   :decimal(10, 6)
#  longitude  :decimal(10, 6)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Trip < ApplicationRecord
  has_many :user_trips, dependent: :destroy
  has_many :users, through: :user_trips

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
