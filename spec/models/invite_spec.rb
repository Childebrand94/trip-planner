# == Schema Information
#
# Table name: invites
#
#  id           :integer          not null, primary key
#  email        :string           not null
#  sender_id    :integer          not null
#  recipient_id :integer
#  token        :string           not null
#  trip_id      :integer          not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
require 'rails_helper'

# rubocop:disable Metrics/BlockLength
RSpec.describe Invite, type: :model do
  describe 'associations' do
    it { should belong_to(:trip) }
    it { should belong_to(:sender).class_name('User') }
    it { should belong_to(:recipient).class_name('User').optional }
  end

  describe 'validation' do
    subject { build(:invite) }

    it { should validate_presence_of(:email) }

    it 'is valid with valid attributes' do
      expect(subject).to be_valid
    end

    it 'is not valid wihtout an email' do
      subject.email = ''
      expect(subject).to_not be_valid
    end
  end

  describe 'callbacks and methods' do
    let(:user) { create(:user, email: 'test@example.com') }
    let(:trip) { create(:trip) }
    let(:invite) do
      build(:invite, email: 'recipent@example.com',
                     trip:,
                     sender: user)
    end

    it 'generates a uinique token before create' do
      invite.save!
      expect(invite.token).to be_present
      expect(invite.token).to be_a(String)
      expect(invite.token.length).to be > 0
    end

    it 'associates the recipent if the user with email exsists' do
      existing_user = create(:user, email: 'existing@example.com')
      invite_with_existing_user = create(:invite,
                                         email: 'existing@example.com',
                                         trip:,
                                         sender: user)
      expect(invite_with_existing_user.recipient_id).to eq(existing_user.id)
    end

    it 'does not associate the recipient if user with email does not exist' do
      invite.save!
      expect(invite.recipient_id).to be_nil
    end
  end
end
# rubocop:enable Metrics/BlockLength
