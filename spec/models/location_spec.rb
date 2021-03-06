require 'rails_helper'

RSpec.describe Location, type: :model do
  it { is_expected.to belong_to(:user) }
  it { is_expected.to have_many(:testimonials).dependent(:destroy) }

  it { is_expected.to validate_presence_of(:lat) }
  it { is_expected.to validate_presence_of(:long) }
end
