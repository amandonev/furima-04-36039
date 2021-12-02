require 'rails_helper'

RSpec.describe PayDelivery, type: :model do
  before do
    @user = FactoryBot.create(:user)
    @item = FactoryBot.build(:item)
    @item.save
    @pay_delivery = FactoryBot.build(:pay_delivery, user_id: @user.id, item_id: @item.id)
    sleep 0.01 # 処理落ちError対策
  end

  describe '商品購入機能' do
    context '内容に問題がない場合' do
      it '全ての値が正しく入力されていれば保存できる' do
        expect(@pay_delivery).to be_valid
      end
    end

    context '必要な値が[空]の場合' do
      it '【postal_code】   郵便番号が空では保存できない' do
        @pay_delivery.postal_code = ''
        @pay_delivery.valid?
        expect(@pay_delivery.errors.full_messages).to include("Postal code can't be blank")
      end

      it '【city】          市区町村が空では保存できない' do
        @pay_delivery.city = ''
        @pay_delivery.valid?
        expect(@pay_delivery.errors.full_messages).to include("City can't be blank")
      end

      it '【address】       番地が空では保存できない' do
        @pay_delivery.address = ''
        @pay_delivery.valid?
        expect(@pay_delivery.errors.full_messages).to include("Address can't be blank")
      end

      it '【phone_number】  電話番号が空では保存できない' do
        @pay_delivery.phone_number = ''
        @pay_delivery.valid?
        expect(@pay_delivery.errors.full_messages).to include("Phone number can't be blank", 'Phone number is invalid')
      end
    end

    context '必要な値が[無効]の場合' do
      it '【postal_code】   郵便番号が[3桁ハイフン4桁]でないと保存できない' do
        @pay_delivery.postal_code = '1234567'
        @pay_delivery.valid?
        expect(@pay_delivery.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end

      it '【phone_number】  電話番号が[10〜11桁以内の半角数値]でないと保存できない' do
        @pay_delivery.phone_number = '090-5669-41'
        @pay_delivery.valid?
        expect(@pay_delivery.errors.full_messages).to include('Phone number is invalid')
      end

      it '【prefecture_id】 都道府県の数値が[1]では保存できない' do
        @pay_delivery.prefecture_id = 1
        @pay_delivery.valid?
        expect(@pay_delivery.errors.full_messages).to include("Prefecture can't be blank")
      end
    end

    context 'クレジットカード情報が[空]の場合' do
      it 'クレジットカード情報が不足している場合は購入できない' do
        @pay_delivery.token = ''
        @pay_delivery.valid?
        expect(@pay_delivery.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
