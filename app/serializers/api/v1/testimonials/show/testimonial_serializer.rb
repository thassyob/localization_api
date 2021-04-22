class Api::V1::Testimonials::Show::TestimonialSerializer < ActiveModel::Serializer
  attributes :id, :comment, :rate
end
