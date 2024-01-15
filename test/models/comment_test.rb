# == Schema Information
#
# Table name: comments
#
#  id                :bigint           not null, primary key
#  body              :text             not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#  author_id         :bigint           not null
#  itinerary_item_id :bigint           not null
#  parent_id         :bigint
#
# Indexes
#
#  index_comments_on_author_id          (author_id)
#  index_comments_on_itinerary_item_id  (itinerary_item_id)
#  index_comments_on_parent_id          (parent_id)
#
# Foreign Keys
#
#  fk_rails_...  (author_id => users.id)
#  fk_rails_...  (itinerary_item_id => itinerary_items.id)
#  fk_rails_...  (parent_id => comments.id)
#
require "test_helper"

class CommentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
