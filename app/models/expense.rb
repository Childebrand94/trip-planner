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
class Expense < ApplicationRecord
  belongs_to :payer, class_name: 'User', foreign_key: 'payer_id'
  belongs_to :itinerary_item, optional: true
  belongs_to :trip

  has_many :debtors, dependent: :destroy, inverse_of: :expense
  has_many :users, through: :debtors
  belongs_to :expense_category

  accepts_nested_attributes_for :debtors
end
