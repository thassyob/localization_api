class Location < ApplicationRecord
  belongs_to :user
  has_many :testimonials, dependent: :destroy

  validates :lat, :long, presence: true
end
