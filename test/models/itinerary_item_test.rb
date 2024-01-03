# == Schema Information
#
# Table name: itinerary_items
#
#  id           :integer          not null, primary key
#  creator_id   :integer          not null
#  trip_id      :integer          not null
#  item_type_id :integer          not null
#  event_name   :string           not null
#  address      :string           not null
#  start_time   :datetime         not null
#  end_time     :datetime         not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
require "test_helper"

class ItineraryItemTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
