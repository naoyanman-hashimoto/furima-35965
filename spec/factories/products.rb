FactoryBot.define do
  factory :product do
    product_name { Faker::Lorem.sentence }
    description { Faker::Lorem.sentence }
    category_id { 2 }
    status_id { 2 }
    burden_id { 2 }
    shipment_source_id { 2 }
    time_required_id { 2 }
    price { 1000 }
    association :user

    after(:build) do |product|
      product.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
