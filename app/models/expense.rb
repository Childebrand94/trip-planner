class Expense < ApplicationRecord
  belongs_to :payer, class_name: 'User', foreign_key: 'payer_id'
  belongs_to :trip
  belongs_to :expense_category
end
