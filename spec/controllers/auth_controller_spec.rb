# spec/controllers/auth_controller_spec.rb
require 'rails_helper'

RSpec.describe AuthController, type: :controller do
  describe '#login' do
    context 'with valid credentials' do
      let(:user) { create(:user, email: 'test@example.com', password: 'password123') }

      before do
        post :login, params: { email: user.email, password: 'password123' }
      end

      it 'returns an accepted status' do
        expect(response).to have_http_status(:accepted)
      end

      it 'returns a token' do
        expect(JSON.parse(response.body)).to have_key('token')
      end
    end

    context 'with incorrect password' do
      let(:user) { create(:user, email: 'test@example.com', password: 'password123') }

      before do
        post :login, params: { email: user.email, password: 'wrongpassword' }
      end

      it 'returns an unauthorized status' do
        expect(response).to have_http_status(:unauthorized)
      end

      it 'returns a message indicating incorrect password' do
        expect(JSON.parse(response.body)['message']).to eq('Incorrect password')
      end
    end

    context 'when user does not exist' do
      before do
        post :login, params: { email: 'nonexistent@example.com', password: 'password123' }
      end

      it 'returns an unauthorized status' do
        expect(response).to have_http_status(:unauthorized)
      end

      it 'returns a message indicating user not found' do
        expect(JSON.parse(response.body)['message']).to eq("User doesn't exist")
      end
    end
  end
end
