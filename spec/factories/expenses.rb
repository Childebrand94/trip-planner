FactoryBot.define do
  factory :expense do
    trip
    payer
    expense_category
    itinerary_item
    name { 'dinner' }
    amount { '100.00' }
    description { 'This is a description' }
    date { Date.today }
  end
end
