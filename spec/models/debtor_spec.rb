require 'rails_helper'

RSpec.describe Debtor, type: :model do
  it { should belong_to(:expense).inverse_of(:debtors) }
  it { should belong_to(:user) }

  describe 'validations' do
    it 'is valid with all attributes' do
      debtor = build(:debtor)
      puts debtor.inspect
      expect(debtor).to be_valid
    end

    it { should validate_presence_of(:user_id) }
  end
end
