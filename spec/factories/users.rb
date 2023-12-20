FactoryBot.define do
  factory :user, aliases: %i[creator author payer] do
    sequence(:display_name) { |n| "user#{n}" }
    sequence(:email) { |n| "user#{n}@example.com" }
    password { 'password' }
  end
end
