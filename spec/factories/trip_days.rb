FactoryBot.define do
  factory :trip_day do
    association :trip, factory: :trip
    date { '2024-01-01' }
  end
end
