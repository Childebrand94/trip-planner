class Expense < ApplicationRecord
  belongs_to :payer, class_name: 'User', foreign_key: 'payer_id'
  belongs_to :itinerary_item, optional: true
  belongs_to :trip

  has_many :debtors, dependent: :destroy, inverse_of: :expense
  has_many :users, through: :debtors
  belongs_to :expense_category

  accepts_nested_attributes_for :debtors
end
