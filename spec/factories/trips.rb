FactoryBot.define do
  factory :trip do
    association :creator, factory: :user
    location    { 'Paris' }
    starting_date { 1.day.from_now }
    ending_date   { 7.days.from_now }
  end
end
