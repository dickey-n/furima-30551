require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '商品が出品できる' do
      it 'image、name、text、category_id、status_id、dekivery_charge_id、dekivery_area_id、day_to_delivery、priceが存在すれば出品できる' do
        expect(@item).to be_valid
      end
      it '価格の範囲が300円〜9,999,999円であれば出品できる' do
        @item.price = 1000
        expect(@item).to be_valid
      end
    end

    context '商品が出品できないとき' do
      it 'Imageが空のときは出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'Nameが空のときは出品できない' do
        @item.name = ' '
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it 'Textが空のときは出品できない' do
        @item.text = ' '
        @item.valid?
        expect(@item.errors.full_messages).to include("Text can't be blank")
      end
      it 'Category_idで『--』を選択したときは出品できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Category Select')
      end
      it 'Status_idで『--』を選択したときは出品できない' do
        @item.status_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Status Select')
      end
      it 'Delivery_charge_idで『--』を選択したときは出品できない' do
        @item.delivery_charge_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery charge Select')
      end
      it 'Delivery_area_idで『--』を選択したときは出品できない' do
        @item.delivery_area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Delivery area Select')
      end
      it 'Day_to_delivery_idで『--』を選択したとき出品できない' do
        @item.day_to_delivery_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Day to delivery Select')
      end
      it 'Priceが空のときは出品できない' do
        @item.price = ' '
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'Priceが300円未満のときは出品できない' do
        @item.price = 1
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Out of setting range')
      end
      it 'Priceが9,999,999円より大きいときは出品できない' do
        @item.price = 10_000_000
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Out of setting range')
      end
      it 'Priceが全角漢字のときは出品できない' do
        @item.price = 'あいうえお'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Half width number')
      end
      it 'Priceが半角英字のときは出品できない' do
        @item.price = 'abcdef'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price Half width number')
      end
    end
  end
end
