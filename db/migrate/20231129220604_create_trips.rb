class CreateTrips < ActiveRecord::Migration[7.1]
  def change
    create_table :trips do |t|
      t.references :creator, null: false, foreign_key: { to_table: :users }
      t.string :name, null: false
      t.string :location, null: false
      t.date :start_date, null: false
      t.date :end_date, null: false
      t.decimal :latitude, precision: 10, scale: 6
      t.decimal :longitude, precision: 10, scale: 6

      t.timestamps
    end
  end
end
