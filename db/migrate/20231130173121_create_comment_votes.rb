class CreateCommentVotes < ActiveRecord::Migration[7.1]
  def change
    create_table :comment_votes do |t|
      t.integer :author_id
      t.integer :comment_id
      t.boolean :up_vote

      t.timestamps
    end
    add_foreign_key :comment_votes, :comments
    add_foreign_key :comment_votes, :users, column: :author_id
  end
end
