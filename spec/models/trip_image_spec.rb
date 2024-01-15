# == Schema Information
#
# Table name: trip_images
#
#  id         :bigint           not null, primary key
#  path       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe TripImage, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
