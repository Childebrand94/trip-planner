class AddDemoToUsers < ActiveRecord::Migration[7.1]
  def change
    add_column :users, :demo, :boolean, default: false
  end
end
