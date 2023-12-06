class AddColumnsToTrip < ActiveRecord::Migration[7.1]
  def change
    add_column :trips, :lat, :decimal, precision: 10, scale: 6
    add_column :trips, :long, :decimal, precision: 10, scale: 6
  end
end
