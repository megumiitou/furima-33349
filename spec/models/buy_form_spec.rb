require 'rails_helper'

RSpec.describe BuyForm, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.create(:item)
      @buy_form = FactoryBot.build(:buy_form, user_id: @user.id, item_id: @item.id)
      sleep 0.5
    end

    context '商品が購入できる時' do

      it '必要な情報を適切に入力すると商品の購入ができること' do
        expect(@buy_form).to be_valid
      end

      it '建物名が抜けていても商品の購入ができること' do
        @buy_form.building_name = ''
        expect(@buy_form).to be_valid
      end

    end


    context '商品が購入できない時' do

      it "tokenが空では商品を購入できないこと" do
        @buy_form.token = ''
        @buy_form.valid?
        expect(@buy_form.errors.full_messages).to include("Token can't be blank")
      end

      it "user_idが空では商品を購入できないこと" do
        @buy_form.user_id = ''
        @buy_form.valid?
        expect(@buy_form.errors.full_messages).to include("User can't be blank")
      end

      it "item_idが空では商品を購入できないこと" do
        @buy_form.item_id = ''
        @buy_form.valid?
        expect(@buy_form.errors.full_messages).to include("Item can't be blank")
      end

      it '郵便番号が半角英数字混合では商品を購入できないこと' do
        @buy_form.postal_code = '111-aaaa'
        @buy_form.valid?
        expect(@buy_form.errors.full_messages).to include("Postal code is invalid")
      end

      it '都道府県が未選択では商品を購入できないこと' do
        @buy_form.shipping_area_id = '1'
        @buy_form.valid?
        expect(@buy_form.errors.full_messages).to include("Shipping area must be other than 1")
      end

      it '市区町村が空では商品を購入できないこと' do
        @buy_form.city = ''
        @buy_form.valid?
        expect(@buy_form.errors.full_messages).to include("City can't be blank")
      end

      it '番地が空では商品を購入できないこと' do
        @buy_form.address = ''
        @buy_form.valid?
        expect(@buy_form.errors.full_messages).to include("Address can't be blank")
      end

      it '電話番号が空では商品を購入できないこと' do
        @buy_form.phone_number = ''
        @buy_form.valid?
        expect(@buy_form.errors.full_messages).to include("Phone number can't be blank")
      end

      it '電話番号にはハイフンを含まない正しい形式でないと商品と購入できないこと' do
        @buy_form.phone_number = '090-1111-1111'
        @buy_form.valid?
        expect(@buy_form.errors.full_messages).to include("Phone number is invalid")
      end

      it '電話番号は11桁以内でないと商品を購入できないこと' do
        @buy_form.phone_number = ('1' * 12)
        @buy_form.valid?
        expect(@buy_form.errors.full_messages).to include("Phone number is invalid")
      end

      it '電話番号は全角数字では商品を購入できないこと' do
        @buy_form.phone_number = ('１' * 11)
        @buy_form.valid?
        expect(@buy_form.errors.full_messages).to include("Phone number is invalid")
      end

      it '電話番号が半角英文字では商品を購入できないこと' do
        @buy_form.phone_number = ('a' * 11)
        @buy_form.valid?
        expect(@buy_form.errors.full_messages).to include("Phone number is invalid")
      end

      it '電話番号が半角英数混合では商品を購入できないこと' do
        @buy_form.phone_number = 'a1a1a1a1a1a'
        @buy_form.valid?
        expect(@buy_form.errors.full_messages).to include("Phone number is invalid")
      end

    end
  end
end
