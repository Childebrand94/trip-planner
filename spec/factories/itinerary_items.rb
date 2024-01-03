# == Schema Information
#
# Table name: itinerary_items
#
#  id           :integer          not null, primary key
#  creator_id   :integer          not null
#  trip_id      :integer          not null
#  item_type_id :integer          not null
#  event_name   :string           not null
#  address      :string           not null
#  start_time   :datetime         not null
#  end_time     :datetime         not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
FactoryBot.define do
  factory :itinerary_item do
    creator
    trip
    item_type
    event_name { 'Dinner' }
    address { '38 Rue de la Montagne Ste Geneviève, 75005 Paris, France' }
    sequence(:start_time) { |n| Time.zone.now + n.hours }
    sequence(:end_time) { |n| Time.zone.now + n.hours + 1.hour }
  end
end
