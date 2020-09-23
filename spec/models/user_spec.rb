require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end

    it 'すべての値が正しく入力されていれば登録できること' do
      expect(@user).to be_valid
    end
    it 'nicknameが空だと登録できないこと' do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'nicknameが40文字以内だと登録できること' do
      @user.nickname = 'Taro'
      expect(@user).to be_valid
    end
    it 'nicknameが40文字より大きいと登録できないこと' do
      @user.nickname = 'aaaaaaaaaassssssssssddddddddddffffffffffg'
      @user.valid?
      expect(@user.errors.full_messages).to include('Nickname is too long (maximum is 40 characters)')
    end
    it 'emailが空だと登録できないこと' do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it 'emailに＠が含まれていないと登録できないこと' do
      @user.email = 'testemail.com'
      @user.valid?
      expect(@user.errors.full_messages).to include('Email is invalid')
    end
    it '重複したemailが存在する場合登録できないこと' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Email has already been taken')
    end
    it 'passwordが空では登録できないこと' do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'passwordが6字以上であれば登録できること' do
      @user.password = '000aaa'
      @user.password_confirmation = '000aaa'
      expect(@user).to be_valid
    end
    it 'passwordが5字以下であれば登録できないこと' do
      @user.password = 'asd00'
      @user.password_confirmation = 'asd00'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
    end
    it 'passwordが数字だけでは登録できないこと' do
      @user.password = '000000'
      @user.password_confirmation = '000000'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid')
    end
    it 'passwordが半角英字だけでは登録できないこと' do
      @user.password = 'aaaaaa'
      @user.password_confirmation = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid')
    end
    it 'passwordが全角英数では登録できないこと' do
      @user.password = 'ａａａ０００'
      @user.password_confirmation = 'ａａａ０００'
      @user.valid?
      expect(@user.errors.full_messages).to include('Password is invalid')
    end
    it 'passwordが存在してもpassword_confirmationが空では登録できないこと' do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'family_name_kanjiが全角日本語だと登録できること' do
      @user.family_name_kanji = '山田'
      expect(@user).to be_valid
    end
    it 'family_name_kanjiが空だと登録できないこと' do
      @user.family_name_kanji = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name kanji can't be blank")
    end
    it 'family_name_kanjiがカタカナだと登録できないこと' do
      @user.family_name_kanji = 'ヤマダ'
      @user.valid?
      expect(@user.errors.full_messages).to include('Family name kanji is invalid')
    end
    it 'first_name_kanjiが全角日本語だと登録できること' do
      @user.first_name_kanji = '太郎'
      expect(@user).to be_valid
    end
    it 'first_name_kanjiが空だと登録できないこと' do
      @user.first_name_kanji = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kanji can't be blank")
    end
    it 'first_name_kanjiがカタカナだと登録できないこと' do
      @user.first_name_kanji = 'タロウ'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name kanji is invalid')
    end
    it 'family_name_katakanaが全角カタカナだと登録できる' do
      @user.family_name_katakana = 'ヤマダ'
      expect(@user).to be_valid
    end
    it 'family_name_katakanaが空だと登録できないこと' do
      @user.family_name_katakana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Family name katakana can't be blank")
    end
    it 'family_name_katakanaが全角日本語だと登録できないこと' do
      @user.family_name_katakana = '山田'
      @user.valid?
      expect(@user.errors.full_messages).to include('Family name katakana is invalid')
    end
    it 'family_name_katakanaが全角カタカナでないと登録できないこと' do
      @user.family_name_katakana = 'ﾔﾏﾀﾞ'
      @user.valid?
      expect(@user.errors.full_messages).to include('Family name katakana is invalid')
    end
    it 'first_name_katakanaが全角カタカナだと登録できる' do
      @user.first_name_katakana = 'タロウ'
      expect(@user).to be_valid
    end
    it 'first_name_katakanaが空だと登録できないこと' do
      @user.first_name_katakana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("First name katakana can't be blank")
    end
    it 'first_name_katakanaが全角日本語だと登録できないこと' do
      @user.first_name_katakana = '太郎'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name katakana is invalid')
    end
    it 'first_name_katakanaが全角カタカナでないと登録できないこと' do
      @user.first_name_katakana = 'ﾀﾛｳ'
      @user.valid?
      expect(@user.errors.full_messages).to include('First name katakana is invalid')
    end
    it 'birth_dayが空だと登録できないこと' do
      @user.birth_day = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth day can't be blank")
    end
  end
end
