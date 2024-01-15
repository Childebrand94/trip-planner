# == Schema Information
#
# Table name: user_trip_roles
#
#  id         :bigint           not null, primary key
#  role       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
FactoryBot.define do
  factory :user_trip_role do
    role { 'Admin' }
  end
end
