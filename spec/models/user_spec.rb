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
      expect(@user.errors.full_messages).to include("ニックネームを入力してください")
    end
    it 'nicknameが40文字より大きいと登録できないこと' do
      @user.nickname = 'aaaaaaaaaassssssssssddddddddddffffffffffg'
      @user.valid?
      expect(@user.errors.full_messages).to include('ニックネームは40文字以内で入力してください')
    end
    it 'emailが空だと登録できないこと' do
      @user.email = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("Eメールを入力してください")
    end
    it 'emailに＠が含まれていないと登録できないこと' do
      @user.email = 'testemail.com'
      @user.valid?
      expect(@user.errors.full_messages).to include('Eメールは不正な値です')
    end
    it '重複したemailが存在する場合登録できないこと' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Eメールはすでに存在します')
    end
    it 'passwordが空では登録できないこと' do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードを入力してください")
    end
    it 'passwordが5字以下であれば登録できないこと' do
      @user.password = 'asd00'
      @user.password_confirmation = 'asd00'
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください')
    end
    it 'passwordが数字だけでは登録できないこと' do
      @user.password = '000000'
      @user.password_confirmation = '000000'
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワードは不正な値です')
    end
    it 'passwordが半角英字だけでは登録できないこと' do
      @user.password = 'aaaaaa'
      @user.password_confirmation = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワードは不正な値です')
    end
    it 'passwordが全角英数では登録できないこと' do
      @user.password = 'ａａａ０００'
      @user.password_confirmation = 'ａａａ０００'
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワードは不正な値です')
    end
    it 'passwordが存在してもpassword_confirmationが空では登録できないこと' do
      @user.password = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("パスワードを入力してください")
    end
    it 'family_name_kanjiが空だと登録できないこと' do
      @user.family_name_kanji = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("名字を入力してください")
    end
    it 'family_name_kanjiがカタカナだと登録できないこと' do
      @user.family_name_kanji = 'ヤマダ'
      @user.valid?
      expect(@user.errors.full_messages).to include('名字は不正な値です')
    end
    it 'first_name_kanjiが空だと登録できないこと' do
      @user.first_name_kanji = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("名前を入力してください")
    end
    it 'first_name_kanjiがカタカナだと登録できないこと' do
      @user.first_name_kanji = 'タロウ'
      @user.valid?
      expect(@user.errors.full_messages).to include('名前は不正な値です')
    end
    it 'family_name_katakanaが空だと登録できないこと' do
      @user.family_name_katakana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("名字カナを入力してください")
    end
    it 'family_name_katakanaが全角日本語だと登録できないこと' do
      @user.family_name_katakana = '山田'
      @user.valid?
      expect(@user.errors.full_messages).to include('名字カナは不正な値です')
    end
    it 'family_name_katakanaが全角カタカナでないと登録できないこと' do
      @user.family_name_katakana = 'ﾔﾏﾀﾞ'
      @user.valid?
      expect(@user.errors.full_messages).to include('名字カナは不正な値です')
    end
    it 'first_name_katakanaが空だと登録できないこと' do
      @user.first_name_katakana = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("名前カナを入力してください")
    end
    it 'first_name_katakanaが全角日本語だと登録できないこと' do
      @user.first_name_katakana = '太郎'
      @user.valid?
      expect(@user.errors.full_messages).to include('名前カナは不正な値です')
    end
    it 'first_name_katakanaが全角カタカナでないと登録できないこと' do
      @user.first_name_katakana = 'ﾀﾛｳ'
      @user.valid?
      expect(@user.errors.full_messages).to include('名前カナは不正な値です')
    end
    it 'birth_dayが空だと登録できないこと' do
      @user.birth_day = nil
      @user.valid?
      expect(@user.errors.full_messages).to include("誕生日を入力してください")
    end
  end
end
