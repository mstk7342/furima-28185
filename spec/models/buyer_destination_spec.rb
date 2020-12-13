require 'rails_helper'

RSpec.describe BuyerDestination, type: :model do
  describe '商品購入' do
    before do
      @buyer_destination = FactoryBot.build(:buyer_destination)
    end

      it 'すべて正しく入力されていれば保存できること' do
        expect(@buyer_destination).to be_valid
      end
  
      it '郵便番号が空のだと登録できない' do
        @buyer_destination.postal_code = nil
        @buyer_destination.valid?
        expect(@buyer_destination.errors.full_messages).to include("Postal code can't be blank")
      end

      it '郵便番号が「−」なしのだと登録できない' do
        @buyer_destination.postal_code = '-'
        @buyer_destination.valid?
        expect(@buyer_destination.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end

      it '都道府県が選択されていないと登録できない' do
        @buyer_destination.prefecture_id = nil
        @buyer_destination.valid?
        expect(@buyer_destination.errors.full_messages).to include("Prefecture can't be blank")
      end

      it '市町村が空のだと登録できない' do
        @buyer_destination.city = nil
        @buyer_destination.valid?
        expect(@buyer_destination.errors.full_messages).to include("City can't be blank")
      end

      it '番地が空のだと登録できない' do
        @buyer_destination.addres = nil
        @buyer_destination.valid?
        expect(@buyer_destination.errors.full_messages).to include("Addres can't be blank")
      end

      it 'ビル名は空でも保存できること' do
        @buyer_destination.building_name = nil
        expect(@buyer_destination).to be_valid
      end

      it '電話番号が空のだと登録できない' do
        @buyer_destination.phone_number = nil
        @buyer_destination.valid?
        expect(@buyer_destination.errors.full_messages).to include("Phone number can't be blank")
      end

      it '電話番号が11行以上だと登録できない' do
        @buyer_destination.phone_number = '111111111111'
        @buyer_destination.valid?
        expect(@buyer_destination.errors.full_messages).to include("Phone number Phone_number is too long (maximum is 11 characters)")
      end
  end
end
