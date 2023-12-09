class CreateItineraryItems < ActiveRecord::Migration[7.1]
  def change
    create_table :itinerary_items do |t|
      t.references :trip_day, null: false, foreign_key: true
      t.references :item_type, null: false, foreign_key: true
      t.string :event_name, null: false
      t.string :address, null: false
      t.datetime :start_time, null: false
      t.datetime :end_time, null: false

      t.timestamps
    end
  end
end
