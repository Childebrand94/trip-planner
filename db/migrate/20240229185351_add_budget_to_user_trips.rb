class AddBudgetToUserTrips < ActiveRecord::Migration[7.1]
  def change
    add_column :user_trips, :budget, :integer
  end
end
