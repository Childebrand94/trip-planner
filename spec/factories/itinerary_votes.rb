# == Schema Information
#
# Table name: itinerary_votes
#
#  id                :integer          not null, primary key
#  itinerary_item_id :integer          not null
#  user_id           :integer          not null
#  up_vote           :boolean          not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
FactoryBot.define do
  factory :itinerary_vote do
    user
    itinerary_item
    up_vote { true }
  end
end
