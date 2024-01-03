require 'rails_helper'

# rubocop:disable Metrics/BlockLength
RSpec.describe SessionsController, type: :controller do
  let(:user) { create(:user, email: 'test@example.com', password: 'password') }

  describe 'GET #new' do
    it 'renders the new template' do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe 'POST #create' do
    context 'with valid credentials' do
      it 'logs in the user and redirects to root path' do
        post :create, params: { user: { email: user.email, password: 'password' } }
        expect(session[:current_user_id]).to eq(user.id)
        expect(response).to redirect_to(root_path)
      end
    end

    context 'with invalid credentials' do
      it 'does not log in the user and renders the new template with an unprocessable entity status' do
        post :create, params: { user: { email: user.email, password: 'wrong_password' } }
        expect(session[:current_user_id]).to be_nil
        expect(response).to render_template(:new)
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'logs out the user and redirects to root path' do
      delete :destroy
      expect(session[:current_user_id]).to be_nil
      expect(response).to redirect_to(root_path)
    end
  end
end
# rubocop:enable Metrics/BlockLength
