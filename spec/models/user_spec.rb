require 'rails_helper'

RSpec.describe User, type: :model do
  describe '#create' do
    before do
      @user = FactoryBot.build(:user)
    end

    describe 'ユーザー新規登録' do
      context '新規登録がうまくいくとき' do
        it '全ての項目の入力が存在すれば登録できる' do
          expect(@user).to be_valid
        end

        it 'passwordが6文字以上であれば登録できる' do
          @user.password = '123abc'
          @user.password_confirmation = '123abc'
          expect(@user).to be_valid
        end
      end


      context '新規登録がうまくいかないとき' do
        it 'nicknameが空では登録できない' do
          @user.nickname = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Nickname can't be blank")
        end

        it 'emailが空では登録できない' do
          @user.email = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Email can't be blank")
        end

        it 'emailに@が存在しない場合登録できない' do
          @user.email = 'abcdefg'
          @user.valid?
          expect(@user.errors.full_messages).to include("Email is invalid")
        end

        it 'passwordは半角英語のみでは登録できない' do
          @user.password = 'abcdefg'
          @user.valid?
          expect(@user.errors.full_messages).to include("Password is invalid")
        end

        it 'passwordは数字のみでは登録できない' do
          @user.password = '1234567'
          @user.valid?
          expect(@user.errors.full_messages).to include("Password is invalid")
        end

        it 'passwordが空では登録できない' do
          @user.password = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Password can't be blank")
        end

        it 'last_nameが空では登録できない' do
          @user.last_name = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name can't be blank")
        end

        it 'first_nameが空では登録できない' do
          @user.first_name = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("First name can't be blank")
        end

        it 'last_name_kanaが空では登録できない' do
          @user.last_name_kana = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name kana can't be blank")
        end

        it 'first_name_kanaが空では登録できない' do
          @user.first_name_kana = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("First name kana can't be blank")
        end

        it 'birthdayが空では登録できない' do
          @user.birthday = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Birthday can't be blank")
        end

        it '重複したemailが存在する場合登録できない' do
          @user.save
          another_user = FactoryBot.build(:user, email: @user.email)
          another_user.valid?
          expect(another_user.errors.full_messages).to include('Email has already been taken')
        end

        it 'passwordが5文字以下であれば登録できない' do
          @user.password = '123ab'
          @user.password_confirmation = '123ab'
          @user.valid?
          expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
        end

        it 'passwordは半角英数字混合でなければ登録できない' do
          @user.password = '123456'
          @user.password_confirmation = '123456'
          @user.valid?
          expect(@user.errors.full_messages).to include('Password is invalid')
        end

        it 'passwordは確認用を含めて２回入力する' do
          @user.password = '123abc'
          @user.password_confirmation = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end

        it 'passwordとpassword_confirmationが不一致では登録できない' do
          @user.password = '123abcd'
          @user.password_confirmation = '123abc'
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end

        it 'last_nameは全角（漢字、ひらがな、カタカナ）で入力しないと登録できない' do
          @user.last_name = 'a'
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name is invalid")
        end

        it 'first_nameは全角（漢字、ひらがな、カタカナ）で入力しないと登録できない' do
          @user.first_name = 'a'
          @user.valid?
          expect(@user.errors.full_messages).to include("First name is invalid")
        end

        it 'last_name_kanaは全角（カタカナ）で入力しないと登録できない' do
          @user.last_name_kana = 'あ'
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name kana is invalid")
        end

        it 'first_name_kanaは全角（カタカナ）で入力しないと登録できない' do
          @user.first_name_kana = 'あ'
          @user.valid?
          expect(@user.errors.full_messages).to include("First name kana is invalid")
        end
      end
    end
  end
end