class RemoveCol < ActiveRecord::Migration[7.1]
  def change
    remove_column :user_trips, :integer
    remove_column :user_trips, :text
  end
end
