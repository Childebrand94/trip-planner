require 'rails_helper'

RSpec.describe Note, type: :model do
  describe 'validation' do
    subject { build(:note) }

    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end
  end
end
