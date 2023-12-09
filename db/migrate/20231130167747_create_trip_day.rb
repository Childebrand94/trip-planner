class CreateTripDay < ActiveRecord::Migration[7.1]
  def change
    create_table :trip_days do |t|
      t.references :trip, null: false, foreign_key: true
      t.date :date, null: false

      t.timestamps
    end
  end
end
