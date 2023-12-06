class ChangeTripsColumnsNullConstraint < ActiveRecord::Migration[7.1]
  def change
    change_column_null :trips, :creator_id, false
    change_column_null :trips, :location, false
    change_column_null :trips, :starting_date, false
    change_column_null :trips, :ending_date, false
    change_column_null :trips, :lat, false
    change_column_null :trips, :long, false
    change_column_null :trips, :name, false
  end
end
