# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  confirm_token   :string
#  demo            :boolean          default(FALSE)
#  display_name    :string           not null
#  email           :string           not null
#  email_confirmed :boolean          default(FALSE)
#  first_name      :string           not null
#  last_name       :string           not null
#  password_digest :text             not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
require 'rails_helper'
# rubocop:disable Metrics/BlockLength
RSpec.describe User, type: :model do
  describe 'validations' do
    subject { build(:user) }

    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid without an email' do
      expect(subject).to validate_presence_of(:email)
    end

    it 'is not valid with duplicate email' do
      create(:user, email: 'user@example.com')
      duplicate_user = build(:user, email: 'user@example.com')
      expect(duplicate_user).not_to be_valid
    end

    it 'is not valid with an incorrect email format' do
      subject.email = 'invalid_email'
      expect(subject).not_to be_valid
    end

    it 'is not valid without a password' do
      subject.password = nil
      expect(subject).not_to be_valid
    end

    it 'is downcased and normalizes' do
      subject.email = 'USER@example.com '
      subject.save
      expect(subject.email).to eq('user@example.com')
    end
  end
end
