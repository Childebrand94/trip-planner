class CreateUserTrips < ActiveRecord::Migration[7.1]
  def change
    create_table :user_trips do |t|
      t.string :user_id
      t.string :integer
      t.integer :trip_id
      t.string :user_role
      t.string :text

      t.timestamps
    end

    add_foreign_key :user_trips, :users
    add_foreign_key :user_trips, :trips
  end
end
