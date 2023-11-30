class AddForeignKeyToTrips < ActiveRecord::Migration[7.1]
  def change
    add_foreign_key :trips, :users, column: :creator_id
  end
end
