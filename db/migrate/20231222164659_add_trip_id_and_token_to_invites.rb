class AddTripIdAndTokenToInvites < ActiveRecord::Migration[7.1]
  def change
    add_column :invites, :trip_id, :integer, null: false
    add_column :invites, :token, :string, null: false

    remove_column :invites, :toke, :string
  end
end
