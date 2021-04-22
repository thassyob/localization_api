require 'rails_helper'

RSpec.describe "Api::V1::Locations", type: :request do
  describe 'POST #create' do
    context 'when creating a location' do
      it 'return 201 status code' do
        user = create(:user)
        location_params = attributes_for(:location, user_id: user.id)

        post '/api/v1/locations', params: { location: location_params }, headers: get_headers(user)

        expect(response).to have_http_status(:created)
      end

      it 'return location created and his attributes' do
        user = create(:user)
        location_params = attributes_for(:location, user_id: user.id)

        post '/api/v1/locations', params: { location: location_params }, headers: get_headers(user)

        expect(json_body).to have_key(:id)
        expect(json_body).to have_key(:location)
        expect(json_body).to have_key(:lat)
        expect(json_body).to have_key(:long)
      end
    end

    context 'when pass invalid params' do
      it 'must return 422 status code' do
        user = create(:user)
        location_params = attributes_for(:location, user: nil)

        post '/api/v1/locations', params: { location: location_params }, headers: get_headers(user)

        expect(response).to have_http_status(:unprocessable_entity)
      end

      it 'must return errors object' do
        user = create(:user)
        location_params = attributes_for(:location, user: nil)

        post '/api/v1/locations', params: { location: location_params }, headers: get_headers(user)

        expect(json_body).to have_key(:errors)
      end
    end
  end
end