# == Schema Information
#
# Table name: debtors
#
#  id          :integer          not null, primary key
#  expense_id  :integer          not null
#  user_id     :integer          not null
#  amount_owed :decimal(10, 2)   not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
require 'rails_helper'

RSpec.describe Debtor, type: :model do
  it { should belong_to(:expense).inverse_of(:debtors) }
  it { should belong_to(:user) }

  describe 'validations' do
    it 'is valid with all attributes' do
      debtor = create(:debtor)
      puts debtor.inspect
      expect(debtor).to be_valid
    end

    it { should validate_presence_of(:user_id) }
  end
end
