class Testimonial < ApplicationRecord
  belongs_to :location

  enum rate: { terrible: 0, low: 1, medium: 2, good: 3, great: 4 }
end
