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
        expect(@order_form.errors.full_messages).to include("Post code is invalid")
      end
      it 'post_codeに全角があると保存できない' do
        @order_form.post_code = 'あああああああ'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Post code is invalid")
      end
      it 'post_codeが「3桁ハイフン4桁」以外だと保存できない' do
        @order_form.post_code = '9876-543'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Post code is invalid")
      end
      it 'post_codeに数字以外の文字があると保存できない' do
        @order_form.post_code = '12s-3445'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Post code is invalid")
      end

      it 'prefecture_idが1だと保存できない' do
        @order_form.prefecture_id = '1'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Prefecture can't be blank")
      end

      it 'cityが空白だと保存できない' do
        @order_form.city = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("City can't be blank")
      end

      it 'addressが空白だと保存できない' do
        @order_form.address = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Address can't be blank")
      end

      it 'phone_numが空白だと保存できない' do
        @order_form.phone_num = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone num is invalid")
      end
      it 'phone_numが9桁以下だと保存できない' do
        @order_form.phone_num = '111'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone num is invalid")
      end
      it 'phone_numが12桁以上だと保存できない' do
        @order_form.phone_num = '1111111111111'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Phone num is invalid")
      end

      it 'tokenが空白だと保存できない' do
        @order_form.token = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
