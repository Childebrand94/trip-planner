require 'rails_helper'

# rubocop:disable Metrics/BlockLength
RSpec.describe 'Trips', type: :request do
  let(:user_password) { 'password' }
  let(:user) { create(:user, email: 'user@gmail.com', password: user_password) }
  let(:trip) { create(:trip) }
  let!(:user_trip) { create(:user_trip, trip:, user:) }

  before do
    post login_path, params: { user: { email: user.email,
                                       password: user_password } }
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

  describe 'POST /create' do
    context 'with valid parameters' do
      let(:valid_attributes) { attributes_for(:trip) }

      it 'creates a new Trip' do
        expect do
          post trips_url, params: { trip: valid_attributes }
        end.to change(Trip, :count).by(1)
      end

      it 'redirects to index of trips' do
        post trips_url, params: { trip: valid_attributes }
        expect(response).to redirect_to(trips_path)
      end
    end

    context 'with invalid parameters' do
      let(:invalid_attributes) { { name: nil } }

      it 'does not create a new Trip' do
        expect do
          post trips_url, params: { trip: invalid_attributes }
        end.to change(Trip, :count).by(0)
      end

      it 'renders the new template with an unprocessable_entity status' do
        post trips_url, params: { trip: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response).to render_template(:new)
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) { attributes_for(:trip, name: 'Updated Trip') }
      let(:return_to_path) { trip_path(trip) }

      it 'updates the requested trip' do
        patch trip_url(trip), params: { trip: new_attributes }
        trip.reload
        expect(trip.name).to eq 'Updated Trip'
      end

      it 'redirects to the return to path' do
        patch trip_url(trip), params:
                          { trip: new_attributes, return_to: return_to_path }
        trip.reload
        expect(response).to redirect_to(trip_path(trip))
      end

      it 'redirects to trips_path if no return_to path is specified' do
        patch trip_url(trip), params: { trip: new_attributes }
        expect(response).to redirect_to(trips_path)
      end
    end

    context 'with invalid parameters' do
      let(:invalid_attributes) { { name: nil } }

      it 'renders the edit template with an unprocessable_entity status' do
        patch trip_url(trip), params: { trip: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response).to render_template(:edit)
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested trip' do
      expect do
        delete trip_url(trip)
      end.to change(Trip, :count).by(-1)
    end

    it 'redirects to the trip list' do
      delete trip_url(trip)
      expect(response).to redirect_to(trips_path)
    end
  end
end
# rubocop:enable Metrics/BlockLength
