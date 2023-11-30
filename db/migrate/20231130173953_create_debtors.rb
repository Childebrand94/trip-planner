class CreateDebtors < ActiveRecord::Migration[7.1]
  def change
    create_table :debtors do |t|
      t.integer :expense_id
      t.integer :debtor_id
      t.integer :amount_owed
      t.boolean :paid

      t.timestamps
    end
    add_foreign_key :debtors, :expenses
    add_foreign_key :debtors, :users, column: :debtor_id
  end
end
