require 'rails_helper'

RSpec.describe UserOrder, type: :model do
  describe '購入者情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @user_order = FactoryBot.build(:user_order, user_id: user.id, item_id: item.id)
      sleep 0.1
    end

    context 'うまくいく場合' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@user_order).to be_valid
      end

      it '建物が空でも保存できる' do
        @user_order.building_name = nil
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
        @user_order.post_code = '1111111'
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
      end

      it '都道府県についての情報が必須であること' do
        @user_order.prefecture_id = 1
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Prefecture can't be blank")
      end

      it '都道府県についての情報が空だと保存できない' do
        @user_order.prefecture_id = nil
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
        expect(@user_order.errors.full_messages).to include('Phone number is 10 or 11 digit numbers')
      end

      it '電話番号は11桁以内であること' do
        @user_order.phone_number = '090000000000'
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include('Phone number is 10 or 11 digit numbers')
      end

      it '電話番号に英字が含まれると保存できないこと' do
        @user_order.phone_number = '090abc0000'
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include('Phone number is 10 or 11 digit numbers')
      end

      it 'トークンが必須であること' do
        @user_order.token = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Token can't be blank")
      end

      it 'ユーザー情報がないと保存できない' do
        @user_order.user_id = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("User can't be blank")
      end

      it '商品情報がないと保存できない' do
        @user_order.item_id = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Item can't be blank")
      end
    end
  end
end
