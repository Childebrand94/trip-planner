FactoryBot.define do
  factory :expense do
    trip
    payer
    expense_category
    name { 'dinner' }
    amount { '100.00' }
    paid { false }
    date { Date.today }
  end
end