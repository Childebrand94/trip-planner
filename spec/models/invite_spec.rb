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
require 'rails_helper'

RSpec.describe Invite, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
