FactoryBot.define do
  factory :testimonial do
    comment { "Lugar muito lindo, voltarei em breve!" }
    rate { :low }
    location { nil }
  end
end
