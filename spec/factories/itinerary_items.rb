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
