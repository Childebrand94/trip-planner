require 'rails_helper'

RSpec.describe ExpenseCategory, type: :model do
  before(:each) do
    ExpenseCategory.delete_all
    Rails.application.load_seed
  end

  it 'has all predefined categories' do
    expected_categories = %w[Accommodation Transportation Food_Dining Activities_Entertainment Shopping Emergency_Funds
                             Insurance Local_Transportation Communication Tips_Gratuities Visas_Permits Health_Wellness
                             Personal_Items Miscellaneous Gifts_Donations Travel_Gear]
    actual_categories = ExpenseCategory.pluck(:name)
    expect(actual_categories.sort).to eq(expected_categories.sort)
  end

  it 'does not have unexpected categories' do
    expected_categories = %w[Accommodation Transportation Food_Dining Activities_Entertainment Shopping
                             Emergency_Funds Insurance Local_Transportation Communication Tips_Gratuities Visas_Permits
                             Health_Wellness Personal_Items Miscellaneous Gifts_Donations Travel_Gear]
    expect(ExpenseCategory.count).to eq(expected_categories.count)
  end
end
