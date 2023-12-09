class CreateItineraryVotes < ActiveRecord::Migration[7.1]
  def change
    create_table :itinerary_votes do |t|
      t.references :itinerary_item, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: { to_table: :users, column: :author_id }
      t.boolean :up_vote

      t.timestamps
    end
  end
end
