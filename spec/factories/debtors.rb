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
FactoryBot.define do
  factory :debtor do
    user
    expense
    amount_owed { 100 }
  end
end
