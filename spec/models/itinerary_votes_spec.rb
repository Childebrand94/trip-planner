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
  end
end
