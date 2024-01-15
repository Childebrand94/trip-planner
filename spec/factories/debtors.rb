# == Schema Information
#
# Table name: debtors
#
#  id          :bigint           not null, primary key
#  amount_owed :decimal(10, 2)   not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  expense_id  :bigint           not null
#  user_id     :bigint           not null
#
# Indexes
#
#  index_debtors_on_expense_id  (expense_id)
#  index_debtors_on_user_id     (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (expense_id => expenses.id)
#  fk_rails_...  (user_id => users.id)
#
FactoryBot.define do
  factory :debtor do
    user
    expense
    amount_owed { 100 }
  end
end
