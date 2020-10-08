require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品出品' do
    before do
      @item = FactoryBot.build(:item)
      @item.image = fixture_file_upload('public/test.png')
    end

    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@item).to be_valid
    end

    it 'Imageが空だと保存できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("画像を入力してください")
    end

    it 'nameが空だと保存できない' do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("商品名を入力してください")
    end

    it 'descriptionが空だと保存できない' do
      @item.description = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("商品の説明を入力してください")
    end

    it 'sale_priceが空だと保存できない' do
      @item.sale_price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("価格を入力してください")
    end

    it 'sale_priceが9,999,999より大きいと保存できない' do
      @item.sale_price = '10000000'
      @item.valid?
      expect(@item.errors.full_messages).to include('価格は10000000より小さい値にしてください')
    end

    it 'sale_priceが300未満だと保存できない' do
      @item.sale_price = '100'
      @item.valid?
      expect(@item.errors.full_messages).to include('価格は300より大きい値にしてください')
    end

    it 'sale_priceが半角数字以外だと保存できない' do
      @item.sale_price = '１０００'
      @item.valid?
      expect(@item.errors.full_messages).to include('価格は数値で入力してください')
    end

    it 'category_idが1だと保存できない' do
      @item.category_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include('カテゴリーは1以外の値にしてください')
    end

    it 'condition_idが1だと保存できない' do
      @item.condition_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include('商品の状態は1以外の値にしてください')
    end

    it 'bear_shipping_fee_idが1だと保存できない' do
      @item.bear_shipping_fee_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include('配送料の負担は1以外の値にしてください')
    end

    it 'shipping_from_idが1だと保存できない' do
      @item.shipping_from_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include('発送元の地域は1以外の値にしてください')
    end

    it 'shipping_within_day_idが1だと保存できない' do
      @item.shipping_within_day_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include('発送までの日数は1以外の値にしてください')
    end

    it 'userが紐づいていなければ商品の出品は保存できない' do
      @item.user = nil
      @item.valid?
      binding.pry
      expect(@item.errors.full_messages).to include('Userを入力してください')
    end
  end
end
