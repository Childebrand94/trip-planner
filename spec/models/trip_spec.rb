require 'rails_helper'

# rubocop:disable Metrics/BlockLength
RSpec.describe Trip, type: :model do
  describe 'validation' do
    subject { build(:trip) }

    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without a name' do
      subject.name = nil
      expect(subject).not_to be_valid
    end

    it 'is not valid without a location' do
      subject.location = nil
      expect(subject).not_to be_valid
    end

    it 'is not valid without a starting date' do
      subject.starting_date = nil
      expect(subject).not_to be_valid
    end

    it 'is not valid without an ending date' do
      subject.ending_date = nil
      expect(subject).not_to be_valid
    end

    it 'is not vaild with start date before end date' do
      subject.ending_date = '2025-01-01'
      subject.starting_date = '2025-01-10'
      expect(subject).not_to be_valid
    end

    it 'is not vaild with invaild date' do
      subject.ending_date = '2023-01-20'
      subject.starting_date = '2023-01-10'
      expect(subject).not_to be_valid
    end
  end
end
