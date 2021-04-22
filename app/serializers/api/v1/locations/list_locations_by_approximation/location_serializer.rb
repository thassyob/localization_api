class Api::V1::Locations::ListLocationsByApproximation::LocationSerializer < ActiveModel::Serializer
  attributes :id, :location, :lat, :long
end