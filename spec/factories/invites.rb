# == Schema Information
#
# Table name: invites
#
#  id           :integer          not null, primary key
#  email        :string           not null
#  sender_id    :integer          not null
#  recipient_id :integer
#  token        :string           not null
#  trip_id      :integer          not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
FactoryBot.define do
  factory :invite do
    association :sender, factory: :user
    trip
    email { 'user@gmail.com' }
  end
end
