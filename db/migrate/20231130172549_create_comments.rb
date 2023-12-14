class CreateComments < ActiveRecord::Migration[7.1]
  def change
    create_table :comments do |t|
      t.references :author, null: false, foreign_key: { to_table: :users }
      t.references :parent, foreign_key: { to_table: :comments }
      t.references :itinerary_item, null: false, foreign_key: { to_table: :itinerary_items }
      t.text :body, null: false

      t.timestamps
    end
  end
end
