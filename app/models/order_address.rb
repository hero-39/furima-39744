class OrderAddress
  include ActiveModel::Model
  attr_accessor :post_code, :shipping_origin_id, :municipalities, :street_address, :building_name, :phone_number, :user_id, :item_id, :order_id

  with_options presence: true do
    validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "is invalid. Include hyphen(-)"}
    validates :shipping_origin_id, numericality: { other_than: 0 , message: "can't be blank" } 
    validates :municipalities
    validates :street_address
    validates :phone_number, length: { minimum: 10, maximum: 11 }, numericality: { only_integer: true }
  end


  def save
    order = Order.create(item_id: item_id, user_id: user_id)
    Address.create(post_code: post_code, shipping_origin_id: shipping_origin_id, municipalities: municipalities, street_address: street_address, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end

end