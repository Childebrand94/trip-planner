class Drop < ActiveRecord::Migration[7.1]
  def change
    drop_table :comment_votes
  end
end
