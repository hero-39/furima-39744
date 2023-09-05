class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  validates :image, presence: true
  validates :product_name, presence: true
  validates :description_of_item, presence: true
  validates :price, presence: true

  with_options presence: true, format: { with: /\A\d+\z/, message: '全角数字を使用してください' } do
    validates :price
 
    validates :price, presence: true, inclusion: { in: 300..9_999_999 }
  
end
