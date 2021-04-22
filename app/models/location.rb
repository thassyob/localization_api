class Location < ApplicationRecord
  belongs_to :user

  validates :lat, :long, presence: true
end
