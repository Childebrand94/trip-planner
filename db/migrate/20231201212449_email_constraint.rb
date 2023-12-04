class EmailConstraint < ActiveRecord::Migration[7.1]
  def change
    add_index :users, :email, unique: true
    change_column :users, :email, :string, null: false
  end
end
