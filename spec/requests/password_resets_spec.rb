require 'rails_helper'

RSpec.describe "PasswordResets", type: :request do
  describe "GET /index" do
    it "returns http success" do
      get "/password_resets/index"
      expect(response).to have_http_status(:success)
    end
  end

end
