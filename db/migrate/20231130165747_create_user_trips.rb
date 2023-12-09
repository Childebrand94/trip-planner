class CreateUserTrips < ActiveRecord::Migration[7.1]
  def change
    create_table :user_trips do |t|
      t.references :user, null: false, foreign_key: true
      t.references :trip, null: false, foreign_key: true
      t.refrences :user_trip_role, null: false, foreign_key: true

      t.timestamps
    end
  end
end
