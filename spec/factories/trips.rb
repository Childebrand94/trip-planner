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
FactoryBot.define do
  factory :trip do
    sequence(:name) { |n| "Trip name #{n}" }
    location { 'Paris' }
    start_date { '2024-01-01' }
    end_date { '2024-01-10' }
    latitude { 48.864716 }
    longitude { 2.349014 }
  end
end
