# == Schema Information
#
# Table name: expense_categories
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

EXPECTED_CATEGORIES = %w[
  flights
  accommodation
  transportation
  food
  activities
  entertainment
  shopping
  insurance
  health
  wellness
  personal_items
  miscellaneous
  travel_gear
].freeze

RSpec.describe ExpenseCategory, type: :model do
  before(:each) do
    ExpenseCategory.delete_all
    Rails.application.load_seed
  end

  it 'has all predefined categories' do
    actual_categories = ExpenseCategory.pluck(:name)
    expect(actual_categories.sort).to eq(EXPECTED_CATEGORIES.sort)
  end

  it 'does not have unexpected categories' do
    expect(ExpenseCategory.count).to eq(EXPECTED_CATEGORIES.count)
  end
end
