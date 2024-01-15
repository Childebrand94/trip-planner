# == Schema Information
#
# Table name: invites
#
#  id           :bigint           not null, primary key
#  email        :string           not null
#  token        :string           not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  recipient_id :integer
#  sender_id    :integer          not null
#  trip_id      :integer          not null
#
FactoryBot.define do
  factory :invite do
    association :sender, factory: :user
    trip
    email { 'user@gmail.com' }
  end
end
