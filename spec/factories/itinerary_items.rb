FactoryBot.define do
  factory :itinerary_item do
    trip
    type
    event_name { 'Dinner' }
    address { '38 Rue de la Montagne Ste Geneviève, 75005 Paris, France' }
    start_date { '2024-06-15 13:45:30' }
    end_date { '2024-06-15 14:45:30' }
  end
end
