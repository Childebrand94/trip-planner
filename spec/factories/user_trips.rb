FactoryBot.define do
  factory :user_trip do
    association :user_id, factory: :user
    user_role { 'admin' }
  end
end
