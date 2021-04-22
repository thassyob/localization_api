class Api::V1::Locations::ListLocationsAlphabetically::LocationSerializer < ActiveModel::Serializer
  attributes :id, :location, :lat, :long
end