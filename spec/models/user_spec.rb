require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end
  
  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it 'すべての空欄を入力すれば登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できない場合' do    
      it 'nicknameが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Nickname can't be blank"
    end
    it 'emailが空では登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Email can't be blank"
    end
    it 'emailが一意性でなければ登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
    it 'emailが@を含まなければ登録できない' do
      @user.email = 'abc'
      @user.valid?
      expect(@user.errors.full_messages).to include "Email is invalid"
    end    
    it 'passwordが空では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Password can't be blank"
    end
    it 'passwordは6文字以上でないと登録できない' do
      @user.password = '12345'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password is too short (minimum is 6 characters)"
    end
    it 'passwordが英字のみではで登録できない' do
      @user.password = 'abc'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password には英字と数字の両方を含めて設定してください"
    end
    it 'passwordが全角では登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Password can't be blank"
    end
    it 'passwordとpassword_confirmationが同じでなければ登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
    end
    it 'password_confirmationが空では登録できない' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
    end
    it 'passwordが半角英数字を含まなければ登録できない' do
      @user.password = '111'
      @user.valid?
      expect(@user.errors.full_messages).to include "Password には英字と数字の両方を含めて設定してください"
    end
    it 'last_nameが空では登録できない' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name can't be blank"
    end
    it 'last_nameが全角（漢字・ひらがな・カタカナ）でなければ登録できない' do
      @user.last_name = 'Smith'
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name 全角文字を使用してください"
    end
    it 'first_nameが空では登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "First name can't be blank"
    end
    it 'first_nameが全角（漢字・ひらがな・カタカナ）でなければ登録できない' do
      @user.first_name = 'Smith'
      @user.valid?
      expect(@user.errors.full_messages).to include "First name 全角文字を使用してください"
    end    
    it 'last_name_kanaが空では登録できない' do
      @user.last_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name kana can't be blank"
    end
    it 'last_name_kanaが全角（カタカナ）でなければ登録できない' do
      @user.last_name_kana = 'Smith' 
      @user.valid?
      expect(@user.errors.full_messages).to include "Last name kana 全角カナを使用してください"
    end
    it 'first_name_kanaが空では登録できない' do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "First name kana can't be blank"
    end
    it 'first_name_kanaが全角（カタカナ）でなければ登録できない' do
      @user.first_name_kana = 'Smith' 
      @user.valid?
      expect(@user.errors.full_messages).to include "First name kana 全角カナを使用してください"
    end
    it 'date_of_birthが空では登録できない' do
      @user.date_of_birth = ''
      @user.valid?
      expect(@user.errors.full_messages).to include "Date of birth can't be blank"
    end
  end
end
end