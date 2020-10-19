require 'rails_helper'

RSpec.describe Order, type: :model do
  describe '購入情報の保存' do
    before do
      @order = FactoryBot.build(:order)
    end

    context '商品が保存できる場合' do
      it '全ての値が正しく入力されていれば登録できること' do
        expect(@order).to be_valid
      end
    end

    context '商品が保存できない場合' do
      it 'tokenが空では保存できない' do
        @order.token = nil
        @order.valid?
        expect(@order.errors.full_messages).to include("Tokenを入力してください")
     end
    end 
  end    
end
