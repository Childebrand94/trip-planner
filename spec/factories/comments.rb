FactoryBot.define do
  factory :comments do
    author
    body { 'example text' }

    trait :with_parent do
      association :parent, factory: :comments
    end
  end
end
