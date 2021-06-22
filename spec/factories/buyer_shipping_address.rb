FactoryBot.define do
  factory :buyer_shipping_address do
    postal_code           { '123-4567' }
    shipment_source_id    { 2 }
    municipalities        { '横浜市' }
    address               { '山田11' }
    building_name         { 'サイレンビル119' }
    phone_number          { '09012345678' }
    token                 { "tok_abcdefghijk00000000000000000" }
  end
end