class Update < ActiveRecord::Migration[7.1]
  def change
    change_column :itinerary_items, :type, :integer
    change_column :user_trips, :user_role, :integer
    rename_column :trips, :location, :address
    change_column :trips, :address, :text
    remove_column :itinerary_votes, :up_vote
    remove_column :expenses, :date
    remove_column :trips, :date
    remove_column :itinerary_items, :start_time
    remove_column :itinerary_items, :end_time
    drop_table :comment_votes
  end
end
