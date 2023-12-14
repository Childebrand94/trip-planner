FactoryBot.define do
  factory :expence do
    trip
    association :payer_id, facory: :user
    expense_category
    name { 'dinner' }
    amount { '100.00' }
    description { 'This is a description' }
    date { Date.today }
  end
end
