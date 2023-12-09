class CreateDebtors < ActiveRecord::Migration[7.1]
  def change
    create_table :debtors do |t|
      t.references :expense, null: false, foreign_key: true
      t.references :debtor, null: false, foreign_key: { to_table: :users }
      t.integer :amount_owed, null: false
      t.boolean :paid, null: false

      t.timestamps
    end
  end
end
