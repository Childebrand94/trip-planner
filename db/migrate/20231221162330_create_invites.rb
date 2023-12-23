class CreateInvites < ActiveRecord::Migration[7.1]
  def change
    create_table :invites do |t|
      t.string :email, null: false
      t.integer :sender_id, null: false
      t.integer :recipient_id
      t.string :token, null: false
      t.integer :trip_id, null: false
      t.timestamps
    end
  end
end
