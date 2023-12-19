class Debtor < ApplicationRecord
  belongs_to :expense, inverse_of: :debtors
  belongs_to :user

  validates :user_id, presence: true
end
