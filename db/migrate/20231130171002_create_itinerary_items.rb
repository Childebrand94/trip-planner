class CreateItineraryItems < ActiveRecord::Migration[7.1]
  def change
    create_table :itinerary_items do |t|
      t.integer :trip_id
      t.text :event_name
      t.text :type
      t.text :address
      t.datetime :date
      t.datetime :start_time
      t.datetime :end_time

      t.timestamps
    end
    add_foreign_key :itinerary_items, :trips
  end
end
