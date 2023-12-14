class CreateUsers < ActiveRecord::Migration[7.1]
  def change
    create_table :users do |t|
      t.text :display_name, null: false
      t.text :email, null: false
      t.text :password_digest, null: false

      t.timestamps
    end
  end
end
