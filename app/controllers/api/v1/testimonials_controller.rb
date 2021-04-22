class Api::V1::TestimonialsController < ApplicationController
  def create
    testimonial = Testimonial.create!(testimonial_params)

    render json: testimonial,
           serializer: Api::V1::Testimonials::Create::TestimonialSerializer,
           status: :created
  end

  def show
    testimonial = Testimonial.find(params[:id])
 
    render json: testimonial,
           serializer: Api::V1::Testimonials::Show::TestimonialSerializer,
           status: :ok
  end

  private

  def testimonial_params
    params.require(:testimonial).permit(:comment, :rate, :location_id)
  end
end
