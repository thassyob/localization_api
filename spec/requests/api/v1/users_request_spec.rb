require 'rails_helper'

RSpec.describe 'Api::V1::Users', type: :request do
  describe 'PUT #update' do
    context 'when pass valid data' do
      it 'return 204 status code' do
        user = create(:user)
        user_params = { name: "Usuario teste", email: "usuario@teste.com", password: "123123123"}

        put "/api/v1/users/#{user.id}", params: { user: user_params }, headers: get_headers(user)

        expect(response).to have_http_status(:no_content)
      end
    end
  end

  describe 'GET #show' do
    context 'when find a user' do
      it 'return 200 status code' do
        user = create(:user)

        get "/api/v1/users/#{user.id}", headers: get_headers(user)

        expect(response).to have_http_status(:ok)
      end

      it 'must return attributes of a user' do
        user = create(:user)

        get "/api/v1/users/#{user.id}", headers: get_headers(user)

        expect(json_body).to have_key(:id)
        expect(json_body).to have_key(:name)
        expect(json_body).to have_key(:email)
      end

    context 'when user is not found'
      it 'return 404 status code' do
        user = create(:user)
        invalid_id = "123"

        get "/api/v1/users/#{invalid_id}", headers: get_headers(user)

        expect(response).to have_http_status(:not_found)
      end
    end
  end
end