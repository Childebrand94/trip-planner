# == Schema Information
#
# Table name: expenses
#
#  id                  :bigint           not null, primary key
#  amount              :decimal(10, 2)   not null
#  date                :date             not null
#  name                :string           not null
#  paid                :boolean          default(FALSE), not null
#  created_at          :datetime         not null
#  updated_at          :datetime         not null
#  expense_category_id :bigint           not null
#  payer_id            :bigint           not null
#  trip_id             :bigint           not null
#
# Indexes
#
#  index_expenses_on_expense_category_id  (expense_category_id)
#  index_expenses_on_payer_id             (payer_id)
#  index_expenses_on_trip_id              (trip_id)
#
# Foreign Keys
#
#  fk_rails_...  (expense_category_id => expense_categories.id)
#  fk_rails_...  (payer_id => users.id)
#  fk_rails_...  (trip_id => trips.id)
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
