# == Schema Information
#
# Table name: notes
#
#  id         :integer          not null, primary key
#  body       :text             not null
#  completed  :boolean          default(FALSE)
#  trip_id    :integer          not null
#  author_id  :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
class Note < ApplicationRecord
  belongs_to :trip
  belongs_to :author, class_name: 'User'

  validates :body, presence: true

  scope :active, -> { where(completed: false) }
  scope :completed, -> { where(completed: true) }
end
