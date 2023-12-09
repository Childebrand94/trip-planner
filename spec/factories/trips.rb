FactoryBot.define do
  factory :trip do
    association :creator, factory: :user
    name { 'Paris Vacation' }
    location { 'Paris' }
    starting_date { '2024-01-01' }
    ending_date { '2024-01-10' }
    lat { 48.864716 }
    long { 2.349014 }
  end
end
