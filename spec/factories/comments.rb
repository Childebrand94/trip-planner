FactoryBot.define do
  factory :comment do
    author
    association :itinerary_item_id, factory: :itinerary_item
    body { 'example text' }
    trait :with_parent do
      association :parent, factory: :comments
    end
  end
end
