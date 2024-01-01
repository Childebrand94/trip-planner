class AddUniqueIndexToUserTrips < ActiveRecord::Migration[6.0]
  def change
    add_index :user_trips, %i[user_id trip_id], unique: true
  end
end
