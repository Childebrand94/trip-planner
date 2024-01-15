# == Schema Information
#
# Table name: debtors
#
#  id          :bigint           not null, primary key
#  amount_owed :decimal(10, 2)   not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  expense_id  :bigint           not null
#  user_id     :bigint           not null
#
# Indexes
#
#  index_debtors_on_expense_id  (expense_id)
#  index_debtors_on_user_id     (user_id)
#
# Foreign Keys
#
#  fk_rails_...  (expense_id => expenses.id)
#  fk_rails_...  (user_id => users.id)
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
