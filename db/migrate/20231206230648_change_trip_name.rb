class ChangeTripName < ActiveRecord::Migration[7.1]
  def change
    reversible do |direction|
      change_table :trips do |t|
        direction.up { t.change :name, :string }
        direction.down { t.change :name, :original_type }
      end
    end
  end
end
