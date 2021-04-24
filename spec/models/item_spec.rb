require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '#create' do
    before do
      @item = FactoryBot.build(:item)
    end

    context '出品ができる時' do

      it '全ての項目の入力が存在すれば出品できる' do
        expect(@item).to be_valid
      end

      it '商品名が40文字以内であれば出品できる' do
        @item.title = ('a' * 40)
        expect(@item).to be_valid
      end

      it '商品の説明が1000文字以内であれば出品できる' do
        @item.text = ('a' * 1000)
        expect(@item).to be_valid
      end

      it '販売価格が¥300以上であれば出品できる' do
        @item.price = 300
        expect(@item).to be_valid
      end

      it '販売価格が¥9,999,999以内であれば出品できる' do
        @item.price = 9999999
        expect(@item).to be_valid
      end

      it '販売価格が半角数字であれば出品できる' do
        @item.price = 500
        expect(@item).to be_valid
      end

    end

    context '出品ができない時' do

      it '出品画像が空では出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it '商品名が空では出品できない' do
        @item.title = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Title can't be blank")
      end

      it '商品の説明が空では出品できない' do
        @item.text = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Text can't be blank")
      end

      it '商品カテゴリーが未選択では出品できない' do
        @item.goods_category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Goods category must be other than 1")
      end

      it '商品の状態が未選択では出品できない' do
        @item.goods_condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Goods condition must be other than 1")
      end

      it '配送料の負担方法が未選択では出品できない' do
        @item.shipping_charge_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping charge must be other than 1")
      end

      it '発送元の地域が未選択では出品できない' do
        @item.shipping_area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping area must be other than 1")
      end

      it '発送までの日数が未選択では出品できない' do
        @item.shipping_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shipping day must be other than 1")
      end

      it '販売価格が空では出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it '販売価格が¥300未満では出品できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end

      it '販売価格が¥9,999,999超では出品できない' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end

      it '販売価格が半角数字でない場合は出品できない' do
        @item.price = '３００'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end

    end
  end
end
