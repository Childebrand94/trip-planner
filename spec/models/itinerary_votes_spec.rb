require 'rails_helper'

RSpec.describe ItineraryVote, type: :model do
  describe 'validation' do
    subject { build(:itinerary_vote) }

    it 'is valid with all attributes' do
      expect(subject).to be_valid
    end

    it 'is not vaild with out a vote' do
      subject.up_vote = nil
      expect(subject).to_not be_valid
    end

    it 'ensures a user can only have one vote per itinerary item' do
      user = create(:user)
      itinerary_item = create(:itinerary_item)

      create(:itinerary_vote, user:, itinerary_item:)

      second_vote = build(:itinerary_vote, user:, itinerary_item:)
      expect(second_vote).not_to be_valid
    end
  end
end
