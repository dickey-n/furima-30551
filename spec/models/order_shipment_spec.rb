require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @order_shipment = FactoryBot.build(:order_shipment)
  end

  describe '商品購入' do
    context '新規登録が正常に行なわれるとき' do
      it 'Token、Price、Post_code、prefecture_id、City_town、address、Building_name、Phone_numberが存在すれば購入できる' do
        expect(@order_shipment).to be_valid
      end
      it 'Building_name以外が存在すれば購入できる' do
        @order_shipment.building_name = nil
        expect(@order_shipment).to be_valid
      end
    end

    context '商品購入が正常に行なわれないとき' do
      it 'Tokenが空のときは購入できない' do
        @order_shipment.token = ' '
        @order_shipment.valid?
        expect(@order_shipment.errors.full_messages).to include("Token can't be blank")
      end
      it 'Post_codeが空のときは購入できない' do
        @order_shipment.post_code = ' '
        @order_shipment.valid?
        expect(@order_shipment.errors.full_messages).to include('Post code Input correctly')
      end
      it 'Post_codeに"-"が含まれていない場合は購入できない' do
        @order_shipment.post_code = '1110011'
        @order_shipment.valid?
        expect(@order_shipment.errors.full_messages).to include('Post code Input correctly')
      end
      it 'Post_codeが数字でないときは購入できない' do
        @order_shipment.post_code = 'あいうえお'
        @order_shipment.valid?
        expect(@order_shipment.errors.full_messages).to include('Post code Input correctly')
      end
      it 'Prefecture_idが選択されていないときは購入できない' do
        @order_shipment.prefecture_id = 1
        @order_shipment.valid?
        expect(@order_shipment.errors.full_messages).to include('Prefecture Select')
      end
      it 'City_townが空のときは購入できない' do
        @order_shipment.city_town = ' '
        @order_shipment.valid?
        expect(@order_shipment.errors.full_messages).to include("City town can't be blank")
      end
      it 'Addressが空のときは購入できない' do
        @order_shipment.address = ' '
        @order_shipment.valid?
        expect(@order_shipment.errors.full_messages).to include("Address can't be blank")
      end
      it 'Phone_numberが空のときは購入できない' do
        @order_shipment.phone_number = ' '
        @order_shipment.valid?
        expect(@order_shipment.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'Phone_numberが数字でないときは購入できない' do
        @order_shipment.phone_number = 'あいうえお'
        @order_shipment.valid?
        expect(@order_shipment.errors.full_messages).to include('Phone number Input only number')
      end
      it 'Phone_numberに"-"が入っているときは購入できない' do
        @order_shipment.phone_number = '090-8899-00'
        @order_shipment.valid?
        expect(@order_shipment.errors.full_messages).to include('Phone number Input only number')
      end
    end
  end
end
