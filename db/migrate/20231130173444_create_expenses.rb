class CreateExpenses < ActiveRecord::Migration[7.1]
  def change
    create_table :expenses do |t|
      t.integer :trip_id
      t.integer :payer_id
      t.text :name
      t.integer :amount
      t.text :description
      t.datetime :date

      t.timestamps
    end
    add_foreign_key :expenses, :trips
    add_foreign_key :expenses, :users, column: :payer_id
  end
end
