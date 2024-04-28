# spec/controllers/application_controller_spec.rb
require 'rails_helper'

RSpec.describe ApplicationController, type: :controller do
  describe '#authorize_request' do
    controller do
      def index
        head :ok
      end
    end

    context 'with valid authorization token' do
      let(:user) { create(:user) }
      let(:token) { JwtTokenService.encode({ user_id: user.id }) }

      before do
        request.headers['Authorization'] = "Bearer #{token}"
        get :index
      end

      it 'sets @current_user' do
        expect(assigns(:current_user)).to eq(user)
      end

      it 'does not render unauthorized response' do
        expect(response).to_not have_http_status(:unauthorized)
      end
    end

    context 'with invalid authorization token' do
      before do
        request.headers['Authorization'] = 'Bearer invalid_token'
        get :index
      end

      it 'renders unauthorized response' do
        expect(response).to have_http_status(:unauthorized)
      end
    end

    context 'without authorization token' do
      before { get :index }

      it 'renders unauthorized response' do
        expect(response).to have_http_status(:unauthorized)
      end
    end
  end
end
