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
require 'rails_helper'

RSpec.describe Note, type: :model do
  describe 'validation' do
    subject { build(:note) }

    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end
  end
end
