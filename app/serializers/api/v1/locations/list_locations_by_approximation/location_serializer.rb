class Api::V1::Locations::ListLocationsByApproximation::LocationSerializer < ActiveModel::Serializer
  attributes :id, :location, :lat, :long

  belongs_to :user, serializer: Api::V1::Locations::ListLocationsByApproximation::UserSerializer
end