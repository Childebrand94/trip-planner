# == Schema Information
#
# Table name: user_trips
#
#  id                :bigint           not null, primary key
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  trip_id           :bigint           not null
#  user_id           :bigint           not null
#  user_trip_role_id :bigint           not null
#
# Indexes
#
#  index_user_trips_on_trip_id              (trip_id)
#  index_user_trips_on_user_id              (user_id)
#  index_user_trips_on_user_id_and_trip_id  (user_id,trip_id) UNIQUE
#  index_user_trips_on_user_trip_role_id    (user_trip_role_id)
#
# Foreign Keys
#
#  fk_rails_...  (trip_id => trips.id)
#  fk_rails_...  (user_id => users.id)
#  fk_rails_...  (user_trip_role_id => user_trip_roles.id)
#
require 'rails_helper'

RSpec.describe UserTrip, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
