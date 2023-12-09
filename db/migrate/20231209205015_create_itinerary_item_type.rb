class CreateItineraryItemType < ActiveRecord::Migration[7.1]
  def change
    create_table :itinerary_item_types do |t|
      t.string :name, null: false

      t.timestamps
    end
  end
end
