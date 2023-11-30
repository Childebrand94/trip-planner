class Expense < ApplicationRecord
  belongs_to :users
  belongs_to :trips
end
