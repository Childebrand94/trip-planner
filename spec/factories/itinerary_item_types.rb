# == Schema Information
#
# Table name: itinerary_item_types
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :itinerary_item_type, aliases: [:item_type] do
    name { 'Dining' }
  end
end
