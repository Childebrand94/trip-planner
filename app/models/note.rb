# == Schema Information
#
# Table name: notes
#
#  id         :bigint           not null, primary key
#  body       :text             not null
#  completed  :boolean          default(FALSE)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  author_id  :bigint           not null
#  trip_id    :bigint           not null
#
# Indexes
#
#  index_notes_on_author_id  (author_id)
#  index_notes_on_trip_id    (trip_id)
#
# Foreign Keys
#
#  fk_rails_...  (author_id => users.id)
#  fk_rails_...  (trip_id => trips.id)
#
class Note < ApplicationRecord
  belongs_to :trip
  belongs_to :author, class_name: 'User'

  validates :body, presence: true

  scope :active, -> { where(completed: false) }
  scope :completed, -> { where(completed: true) }
end
