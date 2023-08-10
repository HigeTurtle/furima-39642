require 'rails_helper'

RSpec.describe User, type: :model do
  describe '会員登録' do
     # 成功テスト
    it '正しく会員登録ができた' do
      expect(@user).to be_valid
    end

     # nickname バリデーション確認
    it 'nicknameが空では登録できない' do
    end

     # email バリデーション確認
    it 'emailが空では登録できない' do
    end
    it 'emailが一意生でないと登録できない' do
    end
    it 'emailに@が含まれないと登録できない' do
    end

     # password バリデーション確認
    it 'passwordが空では登録できない' do
    end
    it 'passwordが6文字未満だと登録できない' do
    end
    it 'passworが半角英数字混合でないと登録できない' do
    end
    it 'passwordとpassword_confirmationが不一致では登録できない' do
    end

     # first_name,last_name バリデーション確認
    it 'first_name,last_nameが空では登録できない' do
    end
    it 'first_name,last_nameが全角でないと登録できない' do
    end

     # first_name_kana,last_name_kana バリデーション確認
    it 'first_name_kana,last_name_kanaが空では登録できない' do
    end
    it 'first_name_kana,last_name_kanaが全角でないと登録できない' do
    end

     # birthday バリデーション確認
    it 'birthdayが空だと登録できない' do
    end

  end
end
