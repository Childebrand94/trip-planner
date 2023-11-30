class Debtor < ApplicationRecord
  belongs_to :expenses
  belongs_to :users
end
