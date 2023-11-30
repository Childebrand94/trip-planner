class CreateUserTripRoles < ActiveRecord::Migration[7.1]
  def change
    create_table :user_trip_roles do |t|
      t.text :role

      t.timestamps
    end
  end
end
