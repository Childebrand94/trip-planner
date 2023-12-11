FactoryBot.define do
  factory :user, aliases: [:creator] do
    first_name { 'John' }
    last_name { 'Doe' }
    sequence(:email) { |n| "user#{n}@example.com" }
    password { 'password' }
  end
end
