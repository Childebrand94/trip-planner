# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  confirm_token   :string
#  demo            :boolean          default(FALSE)
#  display_name    :string           not null
#  email           :string           not null
#  email_confirmed :boolean          default(FALSE)
#  first_name      :string           not null
#  last_name       :string           not null
#  password_digest :text             not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
FactoryBot.define do
  factory :user, aliases: %i[creator author payer] do
    sequence(:display_name) { |n| "user#{n}" }
    sequence(:email) { |n| "user#{n}@example.com" }
    password { 'password' }
    email_confirmed { true }
    sequence(:first_name) { |n| "user#{n}" }
    sequence(:last_name) { |n| "user#{n} last_name" }
  end
end
