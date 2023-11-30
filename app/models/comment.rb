class Comment < ApplicationRecord
  belongs_to :users
  has_many :comment_votes
end
