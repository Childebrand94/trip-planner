# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  display_name    :text             not null
#  email           :text             not null
#  password_digest :text             not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
FactoryBot.define do
  factory :user, aliases: %i[creator author payer] do
    sequence(:display_name) { |n| "user#{n}" }
    sequence(:email) { |n| "user#{n}@example.com" }
    password { 'password' }
  end
end
