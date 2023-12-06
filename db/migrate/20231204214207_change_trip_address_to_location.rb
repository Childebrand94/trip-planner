class ChangeTripAddressToLocation < ActiveRecord::Migration[7.1]
  def change
    rename_column :trips, :address, :location
  end
end
