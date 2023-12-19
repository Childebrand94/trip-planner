class AddDefaultValueToPaidInDebtors < ActiveRecord::Migration[7.1]
  def up
    change_column_default :debtors, :paid, from: nil, to: false
  end

  def down
    change_column_default :debtors, :paid, from: false, to: nil
  end
end
