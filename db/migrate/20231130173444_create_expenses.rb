class CreateExpenses < ActiveRecord::Migration[7.1]
  def change
    create_table :expenses do |t|
      t.references :trip, foreign_key: true, null: false
      t.references :payer, null: false, foreign_key: { to_table: :users }
      t.references :expense_category, null: false, foreign_key: true
      t.string :name, null: false
      t.decimal :amount, precision: 10, scale: 2, null: false
      t.boolean :paid, default: false, null: false
      t.date :date, null: false

      t.timestamps
    end
  end
end
