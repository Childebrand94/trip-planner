FactoryBot.define do
  factory :itinerary_vote do
    user
    itinerary_item
    up_vote { true }
  end
end
