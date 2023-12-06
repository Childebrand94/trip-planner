class AddColumnToTrip < ActiveRecord::Migration[7.1]
  def change
    add_column :trips, :name, :string, null: true
  end
end
