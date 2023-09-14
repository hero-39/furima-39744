require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  
  describe '商品出品' do
    context '商品出品できる場合' do
      it 'すべての空欄を入力すれば登録できる' do
        expect(@item).to be_valid
      end
    end
    context '商品出品できない場合' do    
    it 'userが紐付いていなければ出品できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "User must exist"
    end    
    it 'imageが空では登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include "Image can't be blank"
    end    
    it 'product_nameが空では登録できない' do
      @item.product_name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Product name can't be blank"
    end
    it 'description_of_itemが空では登録できない' do
      @item.description_of_item = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Description of item can't be blank"
    end
    it 'category_idが空では登録できない' do
      @item.category_id = '---'
      @item.valid?
      expect(@item.errors.full_messages).to include "Category can't be blank"
    end
    it 'condition_idが空では登録できない' do
      @item.condition_id = '---'
      @item.valid?
      expect(@item.errors.full_messages).to include "Condition can't be blank"
    end    
    it 'shipping_cost_idが空では登録できない' do
      @item.shipping_cost_id = '---'
      @item.valid?
      expect(@item.errors.full_messages).to include "Shipping cost can't be blank"
    end
    it 'shipping_origin_idが空では登録できない' do
      @item.shipping_origin_id = '---'
      @item.valid?
      expect(@item.errors.full_messages).to include "Shipping origin can't be blank"
    end
    it 'days_to_ship_idが空では登録できない' do
      @item.days_to_ship_id = '---'
      @item.valid?
      expect(@item.errors.full_messages).to include "Days to ship can't be blank"
    end
    it 'priceが空では登録できない' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Price is not a number"
    end
    it 'priceは全角数字では登録できない' do
      @item.price = '１２３'
      @item.valid?
      expect(@item.errors.full_messages).to include "Price is not a number"      
    end
    it 'priceは300〜9,999,999までしか登録できない' do
      @item.price = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include "Price must be greater than or equal to 300"   
    end
    it 'priceは300〜9,999,999までしか登録できない' do
      @item.price = '1_000_000_000'
      @item.valid?
      expect(@item.errors.full_messages).to include "Price must be an integer"   
    end    
  end
end
end