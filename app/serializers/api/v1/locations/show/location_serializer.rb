class Api::V1::Locations::Show::LocationSerializer < ActiveModel::Serializer
  attributes :id, :location, :lat, :long
end