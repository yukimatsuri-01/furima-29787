require 'rails_helper'

RSpec.describe OrderAddress, type: :model do
  describe '購入情報の保存' do
    before do
      @order_address = FactoryBot.build(:order_address)
    end

    it '全ての値が正しく入力されていれば登録できること' do
      expect(@order_address).to be_valid
    end

    it 'postal_codeが空だと保存できない' do
      @order_address.postal_code = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Postal code can't be blank")
    end

    it 'postal_codeにハイフンがないと保存できない' do
      @order_address.postal_code = "8740055"
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Postal code is invalid")
    end

    it 'cityが空だと保存できない' do
      @order_address.city = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("City can't be blank")
    end

    it 'address_lineが空だと保存できない' do
      @order_address.address_line = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Address line can't be blank")
    end

    it 'phone_numberが空だと保存できない' do
      @order_address.phone_number = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number can't be blank")
    end

    it 'phone_numberにハイフンがあると保存できない' do
      @order_address.phone_number = "080-5425-3234"
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number is invalid")
    end

    it 'phone_numberが11桁より大きいと保存できない' do
      @order_address.phone_number = "080454253234"
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Phone number is invalid")
    end

    it 'Prefecture_idが1の値だと保存できない' do
      @order_address.prefecture_id = '1'
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Prefecture must be other than 1")
    end

    it 'tokenが空では保存できない' do
      @order_address.token = nil
      @order_address.valid?
      expect(@order_address.errors.full_messages).to include("Token can't be blank")
    end
  end
end
