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
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it 'nameが空だと保存できない' do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it 'descriptionが空だと保存できない' do
      @item.description = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
    end

    it 'sale_priceが空だと保存できない' do
      @item.sale_price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Sale price can't be blank")
    end

    it 'sale_priceが範囲外の値段だと保存できない' do
      @item.sale_price = '10000000'
      @item.valid?
      expect(@item.errors.full_messages).to include('Sale price must be less than 10000000')
    end

    it 'sale_priceが半角数字以外だと保存できない' do
      @item.sale_price = '１０００'
      @item.valid?
      expect(@item.errors.full_messages).to include('Sale price is not a number')
    end

    it 'category_idが1だと保存できない' do
      @item.category_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include('Category must be other than 1')
    end

    it 'condition_idが1だと保存できない' do
      @item.condition_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include('Condition must be other than 1')
    end

    it 'bear_shipping_fee_idが1だと保存できない' do
      @item.bear_shipping_fee_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include('Bear shipping fee must be other than 1')
    end

    it 'shipping_from_idが1だと保存できない' do
      @item.shipping_from_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include('Shipping from must be other than 1')
    end

    it 'shipping_within_day_idが1だと保存できない' do
      @item.shipping_within_day_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include('Shipping within day must be other than 1')
    end

    it 'userが紐づいていなければ商品の出品は保存できない' do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('User must exist')
    end
  end
end
