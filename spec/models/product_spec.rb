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
        expect(@product.errors.full_messages).to include("Name can't be blank")
      end
      it 'descriptionが空だと出品できない' do
        @product.description = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Description can't be blank")
      end
      it 'priceが空だと出品できない' do
        @product.price = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Price can't be blank")
      end
      it 'priceが¥299以下だと登録できない' do
        @product.price = '299'
        @product.valid?
        expect(@product.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it 'priceが全角数字だと登録できない' do
        @product.price = '１０００'
        @product.valid?
        expect(@product.errors.full_messages).to include("Price is not a number")
      end
      it 'priceが¥10,000,000だと登録できない' do
        @product.price = '10000000'
        @product.valid?
        expect(@product.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
      it 'category_idが空だと出品できない' do
        @product.category_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Category can't be blank")
      end
      it 'condition_idが空だと出品できない' do
        @product.condition_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Condition can't be blank")
      end
      it 'shipping_charge_idが空だと出品できない' do
        @product.shipping_charge_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Shipping charge can't be blank")
      end
      it 'prefecture_idが空だと出品できない' do
        @product.prefecture_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'shipping_day_idがからだと出品できない' do
        @product.shipping_day_id = ''
        @product.valid?
        expect(@product.errors.full_messages).to include("Shipping day can't be blank")
      end
      it 'imageが空だと出品できない' do
        @product.image = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Image Image can't be blank")
      end
    end
  end
end
