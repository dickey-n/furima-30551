require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録が正常に行なわれるとき' do
      it 'Nickname、Email、Password、Password_confrimation、Fist_name、Last_name、First_name_kana、Last_name_kana、Birthdayが存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'Passwordが6文字以上であれば登録できる' do
        @user.password = 'abcd123'
        @user.password_confirmation = 'abcd123'
        expect(@user).to be_valid
      end
    end

    context '新規登録が正常に行なわれないとき' do
      it 'Nicknameが空のときは登録できない' do
        @user.nickname = ' '
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'Emailが空のときは登録できない' do
        @user.email = ' '
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'Emailが既に登録されているものと重複している場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'メールアドレスに＠が含まれていない場合は登録できない' do
        @user.email = 'testtest.com'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it 'Passwordが空のときは登録できない' do
        @user.password = ' '
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'Passwordが存在しても、Password_confirmationが空のときは登録できない' do
        @user.password_confirmation = ' '
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation can't be blank")
      end
      it 'Passwordが半角英数字でないときは登録できない' do
        @user.password = 'ああああああ'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password Include both letters and numbers')
      end
      it 'パスワードが英字のみの場合は登録ができない' do
        @user.password = 'abcdefg'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password Include both letters and numbers')
      end
      it 'パスワードが数字のみの場合は登録ができない' do
        @user.password = '1234567'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password Include both letters and numbers')
      end
      it 'Passwordが5文字以下の場合は登録できない' do
        @user.password = 'aaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'PasswordとPassword_confirmationが不一致の場合は登録できない' do
        @user.password = 'abcdefg'
        @user.password_confirmation = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'First_nameが空のときは登録できない' do
        @user.first_name = ' '
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'Last_nameが空のときは登録できない' do
        @user.last_name = ' '
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it 'First_nameが全角（漢字・ひらがな・カタカナ）以外の場合は登録できない' do
        @user.first_name = 'abcd123'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name Full-width characters')
      end
      it 'Last_nameが全角（漢字・ひらがな・カタカナ）以外の場合は登録できない' do
        @user.last_name = 'abcd123'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name Full-width characters')
      end
      it 'First_name_kanaが空のときは登録できない' do
        @user.first_name_kana = ' '
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana can't be blank")
      end
      it 'Last_name_kanaが空のときは登録できない' do
        @user.last_name_kana = ' '
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana can't be blank")
      end
      it 'First_name_kanaが全角（カタカナ）以外の場合は登録できない' do
        @user.first_name_kana = 'abcd123'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name kana Full-width katakana characters')
      end
      it 'Last_name_kanaが全角（カタカナ）以外の場合は登録できない' do
        @user.last_name_kana = 'abcd123'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name kana Full-width katakana characters')
      end
      it 'Birthdayが空のときは登録できない' do
        @user.birthday = ' '
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
