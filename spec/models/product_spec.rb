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
        end
        it '商品名が必須であること(product_nameが空では保存できない)' do
        end
        it '商品の説明が必須であること(descriptionが空では保存できない)' do
        end
        it 'カテゴリーの情報が必須であること(category_idが未選択では保存できない)' do
        end
        it '商品の状態の情報が必須であること(status_idが未選択では保存できない)' do
        end
        it '配送料の負担の情報が必須であること(burden_idが未選択では保存できない)' do
        end
        it '発送元の地域の情報が必須であること(shipment_source_idが未選択では保存できない)' do
        end
        it '発送までの日数の情報が必須であること(time_required_idが未選択では保存できない)' do
        end
        it '価格の情報が必須であること(priceが未選択では保存できない)' do
        end
        it '価格は、¥300~¥9,999,999の間のみ保存可能であること(¥300以下では保存できない)' do
        end
        it '価格は、¥300~¥9,999,999の間のみ保存可能であること(¥9,999,999以上では保存できない)' do
        end
        it '価格は半角数値のみ保存可能であること(漢数字では保存できない)' do
        end
        it '価格は半角数値のみ保存可能であること(全角数値では保存できない)' do
        end
      end
    end
  end
end
