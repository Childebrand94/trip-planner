class ExpenseCategory < ApplicationRecord
  has_many :expenses

  def self.categories
    pluk(:name)
  end
end
