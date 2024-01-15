# == Schema Information
#
# Table name: itinerary_items
#
#  id           :bigint           not null, primary key
#  address      :string           not null
#  end_time     :datetime         not null
#  event_name   :string           not null
#  start_time   :datetime         not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  creator_id   :bigint           not null
#  item_type_id :bigint           not null
#  trip_id      :bigint           not null
#
# Indexes
#
#  index_itinerary_items_on_creator_id    (creator_id)
#  index_itinerary_items_on_item_type_id  (item_type_id)
#  index_itinerary_items_on_trip_id       (trip_id)
#
# Foreign Keys
#
#  fk_rails_...  (creator_id => users.id)
#  fk_rails_...  (item_type_id => itinerary_item_types.id)
#  fk_rails_...  (trip_id => trips.id)
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
