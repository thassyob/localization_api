class Api::V1::Locations::Create::LocationSerializer < ActiveModel::Serializer
  attributes :id, :location, :lat, :long
end