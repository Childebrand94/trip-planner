require 'rails_helper'

RSpec.describe Trip, type: :model do
  it { should belong_to(:creator).class_name('User') }
end
