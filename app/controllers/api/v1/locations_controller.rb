class Api::V1::LocationsController < ApplicationController
  def create
    location = Location.create!(location_params)
    
    render json: location,
           serializer: Api::V1::Locations::Create::LocationSerializer, 
           status: :created
  end

  private

  def location_params
    params.require(:location).permit(:location, :lat, :long, :user_id)
  end
end
