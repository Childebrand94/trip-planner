# == Schema Information
#
# Table name: comments
#
#  id                :integer          not null, primary key
#  author_id         :integer          not null
#  parent_id         :integer
#  itinerary_item_id :integer          not null
#  body              :text             not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
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
