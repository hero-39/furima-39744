FactoryBot.define do
  factory :item do
    association :user

    after(:build) do |item|
      item.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end

  product_name            {'商品名'}
  description_of_item     {'商品説明'}
  category_id             {1} 
  condition_id            {1} 
  shipping_cost_id        {1}
  shipping_origin_id      {1} 
  days_to_ship_id         {1} 
  price                   {999}
  end
end
