require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録が正常に行なわれるとき' do
      it "Nickname、Email、Password、Password_confrimation、Fist_name、Last_name、First_name_kana、Last_name_kana、Birthdayが存在すれば登録できる" do
        expect(@user).to be_valid
      end
      it "Passwordが6文字以上であれば登録できる" do
        @user.password = "abcd123"
        @user.password_confirmation = "abcd123"
        expect(@user).to be_valid
      end
    end

    context '新規登録が正常に行なわれないとき' do
      it 'Nicknameが空のときは登録できない' do
        ###
      end
      it 'Emailが空のときは登録できない' do
        ###
      end
      it 'Emailが既に登録されているものと重複している場合は登録できない' do
        ###
      end
      it 'Passwordが空のときは登録できない' do
        ###
      end
      it 'Password_confirmationが空のときは登録できない' do
        ###
      end
      it 'Passwordが半角英数字でないときは登録できない' do
        ###
      end
      it 'PasswordとPassword_confirmationが不一致の場合は登録できない' do
        ###
      end
      it 'First_nameが空のときは登録できない' do
        ###
      end
      it 'Last_nameが空のときは登録できない' do
        ###
      end
      it 'First_nameとLast_nameが全角（漢字・ひらがな・カタカナ）以外の場合は登録できない' do
        ###
      end
      it 'First_name_kanaが空のときは登録できない' do
        ###
      end
      it 'Last_name_kanaが空のときは登録できない' do
        ###
      end
      it 'First_name_kanaとLast_name_kanaが全角（カタカナ）以外の場合は登録できない' do
        ###
      end
      it 'Birthdayが空のときは登録できない' do
        ###
      end
    end
  end

end
