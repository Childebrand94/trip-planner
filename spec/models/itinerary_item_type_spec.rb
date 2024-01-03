# == Schema Information
#
# Table name: itinerary_item_types
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
require 'rails_helper'

RSpec.describe ItineraryItemType, type: :model do
  before(:each) do
    ItineraryItemType.delete_all
    Rails.application.load_seed
  end

  it 'has all predefined categories and only those categories' do
    expected_categories = %w[Dining Stay Excursion Business Travel]
    actual_categories = ItineraryItemType.pluck(:name)
    expect(actual_categories.sort).to eq(expected_categories.sort)
  end

  it 'does not have unexpected categories' do
    expected_categories = %w[Dining Stay Excursion Business Travel]
    expect(ItineraryItemType.count).to eq(expected_categories.count)
  end
end
