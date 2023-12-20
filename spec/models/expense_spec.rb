require 'rails_helper'

RSpec.describe Expense, type: :model do
  describe 'validation' do
    subject { build(:expense) }

    it 'is valid with all attributes' do
      expect(subject).to be_valid
    end
  end
end
