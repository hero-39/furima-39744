require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
      @order_address = FactoryBot.build(:order_address, user_id: user.id, item_id: item.id)
  end

  describe '商品購入' do
    context '商品購入できる場合' do
      it 'すべての空欄を入力すれば登録できる' do  
        expect(@order_address).to be_valid
      end
      it '建物名が空欄でも登録できる' do  
        @order_address.building_name = nil
        expect(@order_address).to be_valid
      end
    end
    context '商品出品できない場合' do    
      it 'user(購入者)が紐付いていなければ購入できない' do
        @order_address.user_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "User can't be blank"
      end    
      it 'itemが紐付いていなければ購入できない' do
        @order_address.item_id = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Item can't be blank"
      end    
      it 'post_codeが空では購入できない' do
        @order_address.post_code = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Post code can't be blank"
      end    
      it 'post_codeが空では3桁ハイフン4桁」の半角文字列のみ出なければ購入できない' do
        @order_address.post_code = '１２３４'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Post code is invalid. Include hyphen(-)"
      end    
      it 'shipping_origin_idが空では購入できない' do
        @order_address.shipping_origin_id = '0'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Shipping origin can't be blank"
      end
      it 'municipalitiesが空では購入できない' do
        @order_address.municipalities = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Municipalities can't be blank"
      end    
      it 'street_addressが空では購入できない' do
        @order_address.street_address = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Street address can't be blank"
      end
      it 'phone_numberが空では購入できない' do
        @order_address.phone_number = ''
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Phone number can't be blank", "Phone number is too short (minimum is 10 characters)", "Phone number is not a number"
      end    
      it 'phone_numberが10桁以上11桁以内の半角数値でなければ購入できない' do
        @order_address.phone_number = '１２３'
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include "Phone number is too short (minimum is 10 characters)", "Phone number is not a number"
      end
      it "tokenが空では登録できないこと" do
        @order_address.token = nil
        @order_address.valid?
        expect(@order_address.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end