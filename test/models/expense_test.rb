# == Schema Information
#
# Table name: expenses
#
#  id                  :integer          not null, primary key
#  trip_id             :integer          not null
#  payer_id            :integer          not null
#  expense_category_id :integer          not null
#  name                :string           not null
#  amount              :decimal(10, 2)   not null
#  paid                :boolean          default(FALSE), not null
#  date                :date             not null
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#
require "test_helper"

class ExpenseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
