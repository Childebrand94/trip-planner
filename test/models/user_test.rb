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
require "test_helper"

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
