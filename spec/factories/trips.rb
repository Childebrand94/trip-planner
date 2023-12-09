FactoryBot.define do
  factory :trip do
    association :creator, factory: :user
    name { 'Paris Vacation' }
    location { 'Paris' }
    start_date { '2024-01-01' }
    end_date { '2024-01-10' }
    latitude { 48.864716 }
    longitude { 2.349014 }
  end
end
