require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '商品出品できるとき' do
      it '正しく商品出品できた' do
        expect(@item).to be_valid
      end
    end

    context '商品出品できないとき' do
      # name バリデーション確認
      it 'nameが空では保存できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品名を入力してください")
      end

      # explanation バリデーション確認
      it 'explanationが空では保存できない' do
        @item.explanation = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の説明を入力してください")
      end

      # activehash バリデーション確認
      it 'category_idが「---」の時は保存できない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("カテゴリーを選択してください")
      end
      it 'condition_idが「---」の時は保存できない' do
        @item.condition_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の状態を選択してください")
      end
      it 'charge_idが「---」の時は保存できない' do
        @item.charge_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("配送料の負担を選択してください")
      end
      it 'prefecture_idが「---」の時は保存できない' do
        @item.prefecture_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("配送元の地域を選択してください")
      end
      it 'schedule_idが「---」の時は保存できない' do
        @item.schedule_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("発送までの日数を選択してください")
      end

      # image バリデーション確認
      it 'imageが1枚でもないと保存できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("商品画像を入力してください")
      end
      it 'priceが空では保存できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("価格を入力してください")
      end
      it 'priceが300未満では保存できない' do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("価格は300以上の値にしてください")
      end
      it 'priceが10000000以上では保存できない' do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("価格は9999999以下の値にしてください")
      end
      it '価格に半角数字以外が含まれている場合は保存できない' do
        @item.price = 'あ'
        @item.valid?
        expect(@item.errors.full_messages).to include("価格は数値で入力してください")
      end

      # user バリデーション確認
      it 'userが紐付いていなければ保存できない' do
        @item.user = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Userを入力してください")
      end
    end
  end
end

