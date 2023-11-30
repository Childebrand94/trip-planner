class CreateItineraryVotes < ActiveRecord::Migration[7.1]
  def change
    create_table :itinerary_votes do |t|
      t.integer :author_id
      t.integer :itinerary_item_id
      t.boolean :up_vote

      t.timestamps
    end
    add_foreign_key :itinerary_votes, :itinerary_items
    add_foreign_key :itinerary_votes, :users, column: :author_id
  end
end
