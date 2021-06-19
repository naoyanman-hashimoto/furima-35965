require 'rails_helper'

RSpec.describe Product, type: :model do
  describe '#create' do
    before do
      @product = FactoryBot.build(:product)
    end
    describe '商品出品機能' do
      context '商品出品できる場合' do
        it '必要な情報を適切に入力すると、商品情報がデータベースに保存されること' do
          expect(@product).to be_valid
        end
      end

      context '商品出品できない場合' do
        it '商品画像を1枚つけることが必須であること(imageが空では保存できない)' do
          @product.image = nil
          @product.valid?
          expect(@product.errors.full_messages).to include("Image can't be blank")
        end
        it '商品名が必須であること(product_nameが空では保存できない)' do
          @product.product_name = ''
          @product.valid?
          expect(@product.errors.full_messages).to include("Product name can't be blank")
        end
        it '商品の説明が必須であること(descriptionが空では保存できない)' do
          @product.description = ''
          @product.valid?
          expect(@product.errors.full_messages).to include("Description can't be blank")
        end
        it 'カテゴリーの情報が必須であること(category_idが未選択では保存できない)' do
          @product.category_id = 1
          @product.valid?
          expect(@product.errors.full_messages).to include("Category can't be blank")
        end
        it '商品の状態の情報が必須であること(status_idが未選択では保存できない)' do
          @product.status_id = 1
          @product.valid?
          expect(@product.errors.full_messages).to include("Status can't be blank")
        end
        it '配送料の負担の情報が必須であること(burden_idが未選択では保存できない)' do
          @product.burden_id = 1
          @product.valid?
          expect(@product.errors.full_messages).to include("Burden can't be blank")
        end
        it '発送元の地域の情報が必須であること(shipment_source_idが未選択では保存できない)' do
          @product.shipment_source_id = 1
          @product.valid?
          expect(@product.errors.full_messages).to include("Shipment source can't be blank")
        end
        it '発送までの日数の情報が必須であること(time_required_idが未選択では保存できない)' do
          @product.time_required_id = 1
          @product.valid?
          expect(@product.errors.full_messages).to include("Time required can't be blank")
        end
        it '価格の情報が必須であること(priceが未記入では保存できない)' do
          @product.price = ''
          @product.valid?
          expect(@product.errors.full_messages).to include("Price can't be blank")
        end
        it '価格は、¥300~¥9,999,999の間のみ保存可能であること(¥300以下では保存できない)' do
          @product.price = 100
          @product.valid?
          expect(@product.errors.full_messages).to include("Price is out of setting range")
        end
        it '価格は、¥300~¥9,999,999の間のみ保存可能であること(¥9,999,999以上では保存できない)' do
          @product.price = 100000000
          @product.valid?
          expect(@product.errors.full_messages).to include("Price is out of setting range")
        end
        it '価格は半角数値のみ保存可能であること(漢数字では保存できない)' do
          @product.price = '千円'
          @product.valid?
          expect(@product.errors.full_messages).to include("Price is out of setting range")
        end
        it '価格は半角数値のみ保存可能であること(全角数値では保存できない)' do
          @product.price = '１０００'
          @product.valid?
          expect(@product.errors.full_messages).to include("Price is out of setting range")
        end
      end
    end
  end
end
