require 'rails_helper'

RSpec.describe "Api::V1::Testominials", type: :request do
  describe 'POST #create' do
    context 'when creating a testimonial' do
      it 'return 201 status code' do
        user = create(:user)
        location = create(:location, user_id: user.id)
        testimonial_params = attributes_for(:testimonial, location_id: location.id)

        post '/api/v1/testimonials', params: { testimonial: testimonial_params }, headers: get_headers(user)

        expect(response).to have_http_status(:created)
      end

      it 'return testimonial created and his attributes' do
        user = create(:user)
        location = create(:location, user_id: user.id)
        testimonial_params = attributes_for(:testimonial, location_id: location.id)

        post '/api/v1/testimonials', params: { testimonial: testimonial_params }, headers: get_headers(user)

        expect(json_body).to have_key(:id)
        expect(json_body).to have_key(:comment)
        expect(json_body).to have_key(:rate)
      end
    end

    context 'when pass invalid params' do
      it 'must return 422 status code' do
        user = create(:user)
        testimonial_params = attributes_for(:testimonial, location_id: nil)

        post '/api/v1/testimonials', params: { testimonial: testimonial_params }, headers: get_headers(user)

        expect(response).to have_http_status(:unprocessable_entity)
      end

      it 'must return errors object' do
        user = create(:user)
        testimonial_params = attributes_for(:testimonial, location_id: nil)

        post '/api/v1/testimonials', params: { testimonial: testimonial_params }, headers: get_headers(user)

        expect(json_body).to have_key(:errors)
      end
    end
  end
end
