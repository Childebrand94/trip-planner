require 'rails_helper'

RSpec.describe Trip, type: :model do
  it 'must have a location that is a non-empty string' do
    trip = FactoryBot.create(:trip)

    expect(trip.location).to be_a(String)
    expect(trip.location.length).to be > 1
  end

  it 'must fail' do
    expect(false).to be(false)
  end
end
