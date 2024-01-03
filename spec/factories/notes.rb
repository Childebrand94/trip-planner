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
FactoryBot.define do
  factory :note do
    trip
    author
    body { 'MyText' }
    completed { false }
  end
end
