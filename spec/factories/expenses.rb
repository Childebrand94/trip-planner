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
FactoryBot.define do
  factory :expense do
    trip
    payer
    expense_category
    name { 'dinner' }
    amount { '100.00' }
    paid { false }
    date { Date.today }
  end
end
