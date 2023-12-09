FactoryBot.define do
  factory :itinerary_item do
    trip_day
    item_type
    event_name { 'Dinner' }
    address { '38 Rue de la Montagne Ste Geneviève, 75005 Paris, France' }
    start_time { '2024-06-15 13:45:30' }
    end_time { '2024-06-15 14:45:30' }
  end
end
