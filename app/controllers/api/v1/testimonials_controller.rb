class Api::V1::TestimonialsController < ApplicationController
  def create
    testimonial = Testimonial.create!(testimonial_params)

    render json: testimonial,
           serializer: Api::V1::Testimonials::Create::TestimonialSerializer,
           status: :created
  end

  private

  def testimonial_params
    params.require(:testimonial).permit(:comment, :rate, :location_id)
  end
end
