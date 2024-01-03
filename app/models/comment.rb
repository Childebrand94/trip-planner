# == Schema Information
#
# Table name: comments
#
#  id                :integer          not null, primary key
#  author_id         :integer          not null
#  parent_id         :integer
#  itinerary_item_id :integer          not null
#  body              :text             not null
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#
class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  belongs_to :itinerary_item, class_name: 'ItineraryItem'

  validates :body, presence: true
end
