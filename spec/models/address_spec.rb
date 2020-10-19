require 'rails_helper'

RSpec.describe Address, type: :model do
  describe 'ユーザー新規登録' do
    before do
      @address = FactoryBot.build(:address)
    end
    it 'postal_codeにハイフンがないと保存できない' do
      @address.postal_code = "8740055"
      @address.valid?
      expect(@address.errors.full_messages).to include("郵便番号は不正な値です")
    end

    it 'postal_codeが8字以上だと保存できない' do
      @address.postal_code = "8740-22220"
      @address.valid?
      expect(@address.errors.full_messages).to include("郵便番号は不正な値です")
    end

    it 'cityが空だと保存できない' do
      @address.city = nil
      @address.valid?
      expect(@address.errors.full_messages).to include("市区町村を入力してください")
    end

    it 'address_lineが空だと保存できない' do
      @address.address_line = nil
      @address.valid?
      expect(@address.errors.full_messages).to include("番地を入力してください")
    end

    it 'phone_numberが空だと保存できない' do
      @address.phone_number = nil
      @address.valid?
      expect(@address.errors.full_messages).to include("電話番号を入力してください")
    end

    it 'phone_numberにハイフンがあると保存できない' do
      @address.phone_number = "080-5425-3234"
      @address.valid?
      expect(@address.errors.full_messages).to include("電話番号は不正な値です")
    end

    it 'phone_numberが11桁より大きいと保存できない' do
      @address.phone_number = "080454253234"
      @address.valid?
      expect(@address.errors.full_messages).to include("電話番号は不正な値です")
    end

    it 'Prefecture_idが1の値だと保存できない' do
      @address.prefecture_id = '1'
      @address.valid?
      expect(@address.errors.full_messages).to include("都道府県は1以外の値にしてください")
    end
  end  
end
