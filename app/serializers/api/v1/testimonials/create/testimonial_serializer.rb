class Api::V1::Testimonials::Create::TestimonialSerializer < ActiveModel::Serializer
  attributes :id, :comment, :rate
end
