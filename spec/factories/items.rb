FactoryBot.define do
  factory :item do
    name { Faker::Name.name }
    content { Faker::Lorem.sentence }
    price { Faker::Number.within(range: 300..9_999_999) }
    category_id { Faker::Number.within(range: 2..12) }
    condition_id { Faker::Number.within(range: 2..7) }
    shipping_fee_id { Faker::Number.within(range: 2..3) }
    shipping_area_id { Faker::Number.within(range: 2..48) }
    shipping_date_id { Faker::Number.within(range: 2..4) }
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test.png'), filename: 'test.png')
    end
  end
end
