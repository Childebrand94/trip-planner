# == Schema Information
#
# Table name: trips
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  location   :string           not null
#  start_date :date             not null
#  end_date   :date             not null
#  latitude   :decimal(10, 6)
#  longitude  :decimal(10, 6)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require "test_helper"

class TripTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
