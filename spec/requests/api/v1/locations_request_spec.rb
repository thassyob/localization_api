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

  describe "GET #show" do
    context 'when show a location' do
      it "must return 200 http status code" do
        user = create(:user)
        location = create(:location, user_id: user.id)

        get "/api/v1/locations/#{location.id}", headers: get_headers(user)

        expect(response).to have_http_status(:ok)
      end

      it "must return a location" do
        user = create(:user)
        location = create(:location, user_id: user.id)

        get "/api/v1/locations/#{location.id}", headers: get_headers(user)

        expect(json_body).to have_key(:id)
        expect(json_body).to have_key(:location)
        expect(json_body).to have_key(:lat)
        expect(json_body).to have_key(:long)
        expect(json_body).to have_key(:user)
        expect(json_body[:user]).to have_key(:id)
        expect(json_body[:user]).to have_key(:name)
      end
    end
  end

  describe 'GET #list_locations_alphabetically' do
    context 'when listing locations alphabetically' do
      it 'must return 200 status code' do
        user = create(:user)
        create_list(:location, 2, user_id: user.id)

        get '/api/v1/locations/list_locations_alphabetically', headers: get_headers(user)

        expect(response).to have_http_status(:ok)
      end

      it 'must list locations' do
        user = create(:user)
        create_list(:location, 2, user_id: user.id)

        get '/api/v1/locations/list_locations_alphabetically', headers: get_headers(user)

        expect(json_body[0]).to have_key(:id)
        expect(json_body[0]).to have_key(:location)
        expect(json_body[0]).to have_key(:lat)
        expect(json_body[0]).to have_key(:long)
        expect(json_body[0]).to have_key(:user)
        expect(json_body[0][:user]).to have_key(:id)
        expect(json_body[0][:user]).to have_key(:name)
      end
    end
  end

  describe 'GET #list_locations_by_approximation' do
    context 'when listing list locations by approximation' do
      it 'must return 200 status code' do
        user = create(:user)
        create_list(:location, 2, user_id: user.id)

        get '/api/v1/locations/list_locations_by_approximation', headers: get_headers(user)

        expect(response).to have_http_status(:ok)
      end

      it 'must list locations' do
        user = create(:user)
        create_list(:location, 2, user_id: user.id)

        get '/api/v1/locations/list_locations_by_approximation', headers: get_headers(user)

        expect(json_body[0]).to have_key(:id)
        expect(json_body[0]).to have_key(:location)
        expect(json_body[0]).to have_key(:lat)
        expect(json_body[0]).to have_key(:long)
        expect(json_body[0]).to have_key(:user)
        expect(json_body[0][:user]).to have_key(:id)
        expect(json_body[0][:user]).to have_key(:name)
      end
    end
  end
end