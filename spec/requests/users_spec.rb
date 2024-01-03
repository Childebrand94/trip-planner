require 'rails_helper'

# rubocop:disable Metrics/BlockLength
RSpec.describe 'Users', type: :request do
  let!(:user) { create :user }

  describe 'GET #show' do
    it 'renders successful response' do
      get user_path(user)
      expect(response).to be_successful
    end
  end

  describe 'GET #new' do
    it 'render successful response' do
      get new_user_path
      expect(response).to be_successful
    end
  end

  describe 'GET #edit' do
    it 'render successful response' do
      get edit_user_path(user)
      expect(response).to be_successful
    end
  end

  describe 'GET #edit_password' do
    it 'render successful response' do
      get user_edit_password_path(user)
      expect(response).to be_successful
    end
  end

  describe 'POST /create' do
    context 'with valid parameters' do
      let(:valid_attributes) { attributes_for(:user) }

      it 'creates a new user' do
        expect do
          post users_url, params: { user: valid_attributes }
        end.to change(User, :count).by(1)
      end

      it 'redirects to login path' do
        post users_url, params: { user: valid_attributes }
        expect(response).to redirect_to(login_path)
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) { attributes_for(:user, display_name: 'Updated User') }

      it 'updates the requested user' do
        patch user_url(user), params: { user: new_attributes }
        user.reload
        expect(user.display_name).to eq 'Updated User'
      end

      it 'redirects to the user show' do
        patch user_url(user), params:
                          { user: new_attributes }
        user.reload
        expect(response).to redirect_to(user_path(user))
      end
    end

    context 'with invalid parameters' do
      let(:invalid_attributes) { { display_name: '' } }

      it 'renders the edit template with an unprocessable_entity status' do
        patch user_url(user), params: { user: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response).to render_template(:edit)
      end
    end
  end

  describe 'PATCH /update' do
    context 'with valid parameters' do
      let(:new_attributes) { attributes_for(:user, display_name: 'Updated User') }

      it 'updates the requested user' do
        patch user_url(user), params: { user: new_attributes }
        user.reload
        expect(user.display_name).to eq 'Updated User'
      end

      it 'redirects to the user show' do
        patch user_url(user), params:
                          { user: new_attributes }
        user.reload
        expect(response).to redirect_to(user_path(user))
      end
    end

    context 'with invalid parameters' do
      let(:invalid_attributes) { { display_name: '' } }

      it 'renders the edit template with an unprocessable_entity status' do
        patch user_url(user), params: { user: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response).to render_template(:edit)
      end
    end
  end

  describe 'PATCH /update_password' do
    context 'with valid parameters' do
      let(:new_attributes) do
        {
          old_password: 'password',
          password: 'newpassword',
          password_confirmation: 'newpassword'
        }
      end

      it 'updates the requested user\'s password' do
        patch user_update_password_path(user), params: { user: new_attributes }
        user.reload
        expect(user.authenticate('newpassword')).to be_truthy
      end

      it 'redirects to the user show' do
        patch user_update_password_path(user), params: { user: new_attributes }
        expect(response).to redirect_to(user_path(user))
      end
    end

    context 'with invalid parameters' do
      let(:invalid_attributes) { { display_name: '' } }

      it 'renders the edit template with an unprocessable_entity status' do
        patch user_url(user), params: { user: invalid_attributes }
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response).to render_template(:edit)
      end
    end
  end

  describe 'DELETE /destroy' do
    it 'destroys the requested user' do
      expect do
        delete user_url(user)
      end.to change(User, :count).by(-1)
    end

    it 'redirects to the home page' do
      delete user_url(user)
      expect(response).to redirect_to(root_path)
    end
  end
end
# rubocop:enable Metrics/BlockLength
