require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end
    
    it 'すべての値が正しく入力されていれば登録できること' do
      expect(@user).to be_valid
    end

    it 'nicknameが40文字以内だと登録できること' do
      @user.nickname = 'Taro'
      expect(@user).to be_valid
    end
    
    it 'passwordが6字以上であれば登録できること' do
      @user.password = '000aaa'
      @user.password_confirmation = '000aaa'
      expect(@user).to be_valid
    end
    
    it 'family_name_kanjiが全角日本語だと登録できること' do
      @user.family_name_kanji = '山田'
      expect(@user).to be_valid
    end
    
    it 'first_name_kanjiが全角日本語だと登録できること' do
      @user.first_name_kanji = '太郎'
      expect(@user).to be_valid
    end
    
    it 'family_name_katakanaが全角カタカナだと登録できる' do
      @user.family_name_katakana = 'ヤマダ'
      expect(@user).to be_valid
    end
    
    it 'first_name_katakanaが全角カタカナだと登録できる' do
      @user.first_name_katakana = 'タロウ'
      expect(@user).to be_valid
    end
  end
