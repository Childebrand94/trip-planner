require 'rails_helper'

RSpec.describe User, type: :model do
  it { should have_many(:trips).with_foreign_key('creator_id') }
  it { should have_many(:user_trips).with_foreign_key('user_id') }
end
