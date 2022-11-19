require 'rails_helper'

RSpec.describe Product, type: :model do
  before do
    @product = FactoryBot.build(:product)
  end

  describe '商品情報入力' do
    context '商品が出品できる時' do
      it '必要な情報を適切に入力されれば、出品できること' do
        expect(@product).to be_valid
      end
    end
    context '商品が出品できないとき' do
      it 'nameが空だと出品できない' do
        @product.name = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("商品名を入力してください")
      end
      it 'descriptionが空だと出品できない' do
        @product.description = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("内容を入力してください")
      end
      it 'priceが空だと出品できない' do
        @product.price = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("販売価格を入力してください")
      end
      it 'priceが¥299以下だと登録できない' do
        @product.price = '299'
        @product.valid?
        expect(@product.errors.full_messages).to include('販売価格は300以上の値にしてください')
      end
      it 'priceが全角数字だと登録できない' do
        @product.price = '１０００'
        @product.valid?
        expect(@product.errors.full_messages).to include('販売価格は数値で入力してください')
      end
      it 'priceが¥10,000,000だと登録できない' do
        @product.price = '10000000'
        @product.valid?
        expect(@product.errors.full_messages).to include('販売価格は9999999以下の値にしてください')
      end
      it 'カテゴリーに「---」が選択されている場合は出品できない' do
        @product.category_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("カテゴリーを選択してください")
      end
      it '商品の状態に「---」が選択されている場合は出品できない' do
        @product.condition_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("商品の状態を選択してください")
      end
      it '配送料の負担に「---」が選択されている場合は出品できない' do
        @product.shipping_charge_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("配送料の負担を選択してください")
      end
      it '発送元の地域に「---」が選択されている場合は出品できない' do
        @product.prefecture_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("発送元の地域を選択してください")
      end
      it '発送までの日数に「---」が選択されている場合は出品できない' do
        @product.shipping_day_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("発送までの日数を選択してください")
      end
      it 'imageが空だと出品できない' do
        @product.image = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("画像を選択してください")
      end
      it 'userが紐付いていなければ出品できない' do
        @product.user = nil
        @product.valid?
        expect(@product.errors.full_messages).to include('Userを入力してください')
      end
    end
  end
end
