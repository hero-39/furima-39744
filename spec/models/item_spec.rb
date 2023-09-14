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
    it 'imageが空では登録できない' do
        @item.image = ''
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
    it 'categoryが空では登録できない' do
      @item.category = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Category can't be blank"
    end
    it 'conditionが空では登録できない' do
      @item.condition = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Condition can't be blank"
    end    
    it 'shipping_costが空では登録できない' do
      @item.shipping_cost = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Sipping cost can't be blank"
    end
    it 'shipping_originが空では登録できない' do
      @item.shipping_origin = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Shipping origin can't be blank"
    end
    it 'days_to_shipが空では登録できない' do
      @item.days_to_ship = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Days to ship can't be blank"
    end
    it 'priceが空では登録できない' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include "Price can't be blank"
    end
    it 'priceは全角数字では登録できない' do
      @item.price = 'ABC'
      @item.valid?
      expect(@item.errors.full_messages).to include "Price can't be blank"      
    end
    it 'priceは300〜9,999,999までしか登録できない' do
      @item.price = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include "Price must be between 300 and 9,999,999"   
    end
  end
end