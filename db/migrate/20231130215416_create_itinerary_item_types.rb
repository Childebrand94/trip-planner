class CreateItineraryItemTypes < ActiveRecord::Migration[7.1]
  def change
    create_table :itinerary_item_types do |t|
      t.text :name

      t.timestamps
    end
  end
end
