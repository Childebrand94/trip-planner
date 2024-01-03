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
class Debtor < ApplicationRecord
  belongs_to :expense, inverse_of: :debtors
  belongs_to :user

  validates :user_id, presence: true
end
