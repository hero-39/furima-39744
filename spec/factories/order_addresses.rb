FactoryBot.define do

  factory :order_address do
    post_code { '123-4567' }
    shipping_origin_id { 1 }
    municipalities { '世田谷区' }
    street_address { '1-1' }
    building_name { 'M' }
    phone_number { '09012345678' }  
    token {"tok_abcdefghijk00000000000000000"}
  
  end
end
