require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録できる場合' do
      it '全ての入力必須項目が存在すれば登録できる' do
        expect(@user).to be_valid
      end

      context '値が空によって新規登録ができない場合' do
        it 'nick_nameが空の場合は登録できない' do
          @user.nick_name = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Nick name can't be blank")
        end

        it 'emailが空の場合は登録できない' do
          @user.email = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Email can't be blank")
        end

        it 'passwordが空の場合は登録できない' do
          @user.password = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Password can't be blank")
        end

        it 'first_nameが空の場合は登録できない' do
          @user.first_name = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("First name can't be blank")
        end

        it 'first_name_kanaが空の場合は登録できない' do
          @user.first_name_kana = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("First name kana can't be blank")
        end

        it 'last_nameが空の場合は登録できない' do
          @user.last_name = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name can't be blank")
        end

        it 'last_name_kanaが空の場合は登録できない' do
          @user.last_name_kana = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Last name kana can't be blank")
        end

        it 'birth_dateが空の場合は登録できない' do
          @user.birth_date = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Birth date can't be blank")
        end

        context '条件不足によって新規登録できない場合' do
          it '重複したemailが存在する場合は登録できない' do
            @user.save
            user_2 = FactoryBot.build(:user, email: @user.email)
            user_2.valid?
            expect(user_2.errors.full_messages).to include('Email has already been taken')
          end

          it 'emailに＠が含まれていない場合は登録できない' do
            @user.email = 'abcd.com'
            @user.valid?
            expect(@user.errors.full_messages).to include('Email is invalid')
          end

          it 'passwordが６文字未満の場合は登録できない' do
            @user.password = 'abc12'
            @user.valid?
            expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
          end

          it 'passwordとencrypted_passwordが一致しない場合は登録できない' do
            @user.password_confirmation = 'aaa222'
            @user.valid?
            expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
          end

          it 'passwordが数字のみでは場合は登録できない' do
            @user.password = '123456'
            @user.password_confirmation = '123456'
            @user.valid?
            expect(@user.errors.full_messages).to include('Password is invalid')
          end

          it 'passwordが英字のみでは場合は登録できない' do
            @user.password = 'abcdef'
            @user.password_confirmation = 'abcdef'
            @user.valid?
            expect(@user.errors.full_messages).to include('Password is invalid')
          end

          it 'passwordが全角の場合は登録できない' do
            @user.password = 'ａａａ１１１'
            @user.password_confirmation = 'ａａａ１１１'
            @user.valid?
            expect(@user.errors.full_messages).to include('Password is invalid')
          end

          it 'first_name【性】に半角文字が含まれる場合は登録できない' do
            @user.first_name = 'ﾊﾝｶｸ'
            @user.valid?
            expect(@user.errors.full_messages).to include('First name is invalid')
          end

          it 'last_name【名】に半角文字が含まれる場合は登録できない' do
            @user.last_name = 'ﾀﾛｳ'
            @user.valid?
            expect(@user.errors.full_messages).to include('Last name is invalid')
          end

          it 'first_name_kana【性：フリガナ】に半角文字が含まれる場合は登録できない' do
            @user.first_name_kana = 'ﾊﾝｶｸ'
            @user.valid?
            expect(@user.errors.full_messages).to include('First name kana is invalid')
          end

          it 'last_name_kana【名：フリガナ】に半角文字が含まれる場合は登録できない' do
            @user.last_name_kana = 'ﾀﾛｳ'
            @user.valid?
            expect(@user.errors.full_messages).to include('Last name kana is invalid')
          end

          it 'first_name_kana【性：フリガナ】に「ひらがな・漢字」が含まれる場合は登録できない' do
            @user.first_name_kana = '平がな'
            @user.valid?
            expect(@user.errors.full_messages).to include('First name kana is invalid')
          end

          it 'last_name_kana【名：フリガナ】に「ひらがな・漢字」が含まれる場合は登録できない' do
            @user.last_name_kana = '太ろう'
            @user.valid?
            expect(@user.errors.full_messages).to include('Last name kana is invalid')
          end
        end
      end
    end
  end
end
