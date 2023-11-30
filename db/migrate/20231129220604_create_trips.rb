class CreateTrips < ActiveRecord::Migration[7.1]
  def change
    create_table :trips do |t|
      t.integer :creator_id
      t.string :location
      t.date :starting_date
      t.date :ending_date

      t.timestamps
    end
  end
end
