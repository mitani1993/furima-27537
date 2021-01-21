require 'rails_helper'

RSpec.describe UserOrder, type: :model do
  describe '購入者情報の保存' do
    before do
      @user_order = FactoryBot.build(:user_order)
    end

    context 'うまくいく場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@user_order).to be_valid
      end
    end

    context 'うまくいかない場合' do
      it '郵便番号が空だと保存できない' do
        @user_order.post_code = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Post code can't be blank")
      end

      it '郵便番号にハイフンがないと保存できない' do
        @user_order.post_code = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
      end

      it '郵便番号にハイフンがないと保存できない' do
        @user_order.post_code = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
      end

      it '都道府県についての情報が必須であること' do
        @user_order.prefecture_id = 1
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Prefecture can't be blank")
      end

      it '市区町村についての情報が必須であること' do
        @user_order.city = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("City can't be blank")
      end

      it '番地についての情報が必須であること' do
        @user_order.house_number = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("House number can't be blank")
      end

      it '電話番号についての情報が必須であること' do
        @user_order.phone_number = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Phone number can't be blank")
      end

      it '電話番号は10桁もしくは11桁であること' do
        @user_order.phone_number = '090000000'
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include('Phone number is 10 digits or 11 digits')
      end

      it 'トークンが必須であること' do
        @user_order.token = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
