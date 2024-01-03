# == Schema Information
#
# Table name: debtors
#
#  id          :integer          not null, primary key
#  expense_id  :integer          not null
#  user_id     :integer          not null
#  amount_owed :decimal(10, 2)   not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require "test_helper"

class DebtorTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
