class CommentVote < ApplicationRecord
  belongs_to :users
  belongs_to :comments
end
