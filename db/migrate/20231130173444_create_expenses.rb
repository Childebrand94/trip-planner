class CreateExpenses < ActiveRecord::Migration[7.1]
  def change
    create_table :expenses do |t|
      t.references :trip, foreign_key: true, null: false
      t.references :payer, null: false, foreign_key: { to_table: :users }
      t.string :name, null: false
      t.integer :amount, null: false
      t.string :description, null: false
      t.datetime :date, null: false

      t.timestamps
    end
  end
end
