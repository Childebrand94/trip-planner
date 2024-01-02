FactoryBot.define do
  factory :debtor do
    user
    expense
    amount_owed { 100 }
  end
end
