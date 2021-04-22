class Api::V1::LocationsController < ApplicationController
  def create
    location = Location.create!(location_params)
    
    render json: location,
           serializer: Api::V1::Locations::Create::LocationSerializer, 
           status: :created
  end

  def show
    location = Location.find(params[:id])
 
    render json: location,
           serializer: Api::V1::Locations::Show::LocationSerializer,
           status: :ok
  end

  def list_locations_alphabetically
    locations = Location.all
                        .order(location: :asc)

    render json: locations,
           each_serializer: Api::V1::Locations::ListLocationsAlphabetically::LocationSerializer,
           status: :ok
  end

  private

  def location_params
    params.require(:location).permit(:location, :lat, :long, :user_id)
  end
end
