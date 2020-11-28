require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品登録' do
    before do
      @item = FactoryBot.build(:item)
    end

    context '商品登録がうまくいくとき' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@item).to be_valid
      end
      it '価格が300円〜9999999円' do
        @item.price = 1000
        expect(@item).to be_valid
      end
    end

    context '商品登録ができないとき' do
      it '商品名が空だと登録できない' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end
      it '商品説明が空だと登録できない' do
        @item.description = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end
      it '商品画像が空だと登録できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'カテゴリーが選択されていないとき、登録できない' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it '配送料の負担が選択されていないとき、登録できない' do
        @item.shopping_cost_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shopping cost can't be blank")
      end
      it '発送地域が選択されていないとき、登録できない' do
        @item.prefectures_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefectures can't be blank")
      end
      it '発送日数が選択されていないとき、登録できない' do
        @item.shopping_days_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Shopping days can't be blank")
      end
      it '価格が空だと登録できないとき、登録できない' do
        @item.price = nil
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is invalid. Input half-width characters.')
      end
      it '価格が全角数字でなければ登録できない' do
        @item.price = '１０００'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is invalid. Input half-width characters.')
      end
      it "価格が299円以下の場合は登録できない" do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include('Price is out of setting range')
      end
      it "価格が1000万円以上の場合、登録できない" do
      @item.price = '10000000'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price is out of setting range')
      end
    end
  end
end
