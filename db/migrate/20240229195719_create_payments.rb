class CreatePayments < ActiveRecord::Migration[7.1]
  def change
    create_table :payments do |t|
      t.integer :amount_paid
      t.references :states, null: false, foreign_key: true
      t.references :expense, null: false, foreign_key: true
      t.references :debtor, null: false, foreign_key: true

      t.timestamps
    end
  end
end
