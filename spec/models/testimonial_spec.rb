require 'rails_helper'

RSpec.describe Testimonial, type: :model do
  it { is_expected.to belong_to(:location) }

  it { is_expected.to define_enum_for(:rate).with_values(terrible: 0, low: 1, medium: 2, good: 3, great: 4) }
end
