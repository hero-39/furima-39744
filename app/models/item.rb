class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  has_one_attached :image

  belongs_to :category
  belongs_to :condition
  belongs_to :shipping_cost
  belongs_to :shipping_origin
  belongs_to :days_to_ship  

  validates :category_id, numericality: { other_than: 1 , message: "can't be blank" } 
  validates :condition_id, numericality: { other_than: 1 , message: "can't be blank" } 
  validates :shipping_cost_id, numericality: { other_than: 1 , message: "can't be blank" } 
  validates :shipping_origin, numericality: { other_than: 0 , message: "can't be blank" } 
  validates :days_to_ship_id, numericality: { other_than: 1 , message: "can't be blank" } 

 
  validates :image, presence: true
  validates :product_name, presence: true
  validates :description_of_item, presence: true
  validates :price, presence: true

  validates :price, presence: true, inclusion: { in: 300..9_999_999 }  
  
  with_options presence: true, format: { with: /\A\d+\z/, message: '全角数字を使用してください' } do
    validates :price

  end
end
