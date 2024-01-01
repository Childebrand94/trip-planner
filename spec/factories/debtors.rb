FactoryBot.define do
  factory :debtor do
    association :user
    association :expense
    amount_owed { 100 }
  end
end
