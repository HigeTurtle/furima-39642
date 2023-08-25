require 'rails_helper'

RSpec.describe OrderForm, type: :model do
  describe '購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @order_form = FactoryBot.build(:order_form, user_id: user.id, item_id: item.id)
      sleep 0.1
    end

    context '内容に問題ない場合' do
      it 'すべての情報が保存できる' do
        expect(@order_form).to be_valid
      end
      it 'buildingが空白でも保存できる' do
        @order_form.building = ''
        expect(@order_form).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'post_codeが空白だと保存できない' do
        @order_form.post_code = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("郵便番号を入力してください")
      end
      it 'post_codeに全角があると保存できない' do
        @order_form.post_code = 'あああああああ'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("郵便番号は不正な値です")
      end
      it 'post_codeが「3桁ハイフン4桁」以外だと保存できない' do
        @order_form.post_code = '9876-543'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("郵便番号は不正な値です")
      end
      it 'post_codeに数字以外の文字があると保存できない' do
        @order_form.post_code = '12s-3445'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("郵便番号は不正な値です")
      end

      it 'prefecture_idが1だと保存できない' do
        @order_form.prefecture_id = '1'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("都道府県が未入力です")
      end

      it 'cityが空白だと保存できない' do
        @order_form.city = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("市区町村を入力してください")
      end

      it 'addressが空白だと保存できない' do
        @order_form.address = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("番地を入力してください")
      end

      it 'phone_numが空白だと保存できない' do
        @order_form.phone_num = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("電話番号は不正な値です")
      end
      it 'phone_numが9桁以下だと保存できない' do
        @order_form.phone_num = '111'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("電話番号は不正な値です")
      end
      it 'phone_numが12桁以上だと保存できない' do
        @order_form.phone_num = '1111111111111'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("電話番号は不正な値です")
      end
      it 'phone_numに半角数字以外が含まれている場合は保存できない' do
        @order_form.phone_num = '1111111111あ'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("電話番号は不正な値です")
      end

      it 'tokenが空白だと保存できない' do
        @order_form.token = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("クレジットカード情報を入力してください")
      end

      it 'user_idが空白だと保存できない' do
        @order_form.user_id = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Userを入力してください")
      end
      it 'item_idが空白だと保存できない' do
        @order_form.item_id = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Itemを入力してください")
      end
    end
  end
end
