require 'rails_helper'

# rubocop:disable Metrics/BlockLength
RSpec.describe 'Trips', type: :request do
  let(:user_password) { 'password' }
  let(:user) { create(:user, email: 'user@gmail.com', password: user_password) }
  let(:trip) { create(:trip) }
  let!(:user_trip) { create(:user_trip, trip:, user:) }

  before do
    post login_path, params: { user: { email: user.email, password: user_password } }
  end

  describe 'GET #index' do
    it 'render successful response' do
      get trips_path(trip)
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    it 'render successful response' do
      get trip_path(trip)
      expect(response).to be_successful
    end
  end

  describe 'GET #new' do
    it 'render successful response' do
      get new_trip_path
      expect(response).to be_successful
    end
  end

  describe 'GET #edit' do
    it 'render successful response' do
      get edit_trip_path(trip)
      expect(response).to be_successful
    end
  end
end
# rubocop:enable Metrics/BlockLength
