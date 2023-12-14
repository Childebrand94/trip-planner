FactoryBot.define do
  factory :user, aliases: %i[creator author] do
    display_name { 'John' }
    sequence(:email) { |n| "user#{n}@example.com" }
    password { 'password' }
  end
end
