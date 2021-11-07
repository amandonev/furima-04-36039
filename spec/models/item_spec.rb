require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '出品機能' do
    context '【出品できる】場合' do
      it '全ての入力必須項目が存在すれば登録できる' do
        expect(@item).to be_valid
      end
    end

    context '【必須項目が空】によって出品できない場合' do
      it '[商品画像]を添付していない場合は出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it '[商品名]が空の場合は出品できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it '[商品の説明]が場合は出品できない' do
        @item.info = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Info can't be blank")
      end

      it '[販売価格]が空の場合は出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
    end

    context '【各activehashのidが1】だった場合は出品できない' do
      it '[カテゴリー]のidが1の場合は出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it '[商品の状態]のidが1の場合は出品できない' do
        @item.sales_status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Sales status can't be blank")
      end

      it '[配送の負担]のidが1の場合は出品できない' do
        @item.shipping_fee_status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping fee status can't be blank")
      end

      it '[発送元の地域]のidが1の場合は出品できない' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture can't be blank")
      end

      it '[発送までの日数]のidが1の場合は出品できない' do
        @item.scheduled_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Scheduled can't be blank")
      end
    end

    context '【入力情報の不備】によって出品できない場合' do
      it '[販売価格]が¥300未満で入力された場合は出品できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be greater than or equal to 300')
      end

      it '[販売価格]が8桁(¥10000000)以上で入力された場合は出品できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price must be less than or equal to 9999999')
      end

      it '[販売価格]は半角数字以外では出品できない' do
        @item.price = '１００００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is not a number')
      end
    end
   
    context '【アソシエーションに関する不備】があった場合' do
      it 'ユーザーが紐づいていないと出品できない'do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("User must exist")
      end
    end

  end
end
