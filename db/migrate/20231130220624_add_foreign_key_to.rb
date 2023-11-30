class AddForeignKeyTo < ActiveRecord::Migration[7.1]
  def change
    add_foreign_key :itinerary_items, :itinerary_item_types, column: :type
    add_foreign_key :user_trips, :user_trip_roles, column: :user_role
  end
end
