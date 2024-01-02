class CreateNotes < ActiveRecord::Migration[7.1]
  def change
    create_table :notes do |t|
      t.text :body, null: false
      t.boolean :completed, default: false
      t.references :trip, null: false, foreign_key: true
      t.references :author, null: false, foreign_key: { to_table: :users }

      t.timestamps
    end
  end
end
