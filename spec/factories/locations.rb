FactoryBot.define do
  factory :location do
    location { 'Maceió - AL' }
    lat { '09º 39 57' }
    long { '035º 44 07' }
    user { nil }
  end
end
