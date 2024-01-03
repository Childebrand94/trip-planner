# == Schema Information
#
# Table name: user_trips
#
#  id                :integer          not null, primary key
#  user_id           :integer          not null
#  trip_id           :integer          not null
#  user_trip_role_id :integer          not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
require "test_helper"

class UserTripTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
