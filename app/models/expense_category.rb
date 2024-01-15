# == Schema Information
#
# Table name: expense_categories
#
#  id         :bigint           not null, primary key
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class ExpenseCategory < ApplicationRecord
  has_many :expenses

  def self.categories
    pluk(:name)
  end
end
