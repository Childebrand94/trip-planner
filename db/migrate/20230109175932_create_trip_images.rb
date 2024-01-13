class CreateTripImages < ActiveRecord::Migration[7.1]
  def change
    create_table :trip_images do |t|
      t.string :path, null: false

      t.timestamps
    end
  end
end
