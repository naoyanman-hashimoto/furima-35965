require 'rails_helper'

RSpec.describe BuyerShippingAddress, type: :model do
  describe '#create' do
    before do
      user = FactoryBot.create(:user)
      product = FactoryBot.create(:product)
      @buyer_shipping_address = FactoryBot.build(:buyer_shipping_address, user_id: user.id, product_id: product.id)
      sleep 0.1
    end
    describe '商品購入機能' do
      context '商品購入できる場合' do
        it '必要な情報を適切に入力すると、商品の送付先情報がデータベースに保存されること' do
          expect(@buyer_shipping_address).to be_valid
        end
        it '建物名(building_name)は空でも購入できる' do
          @buyer_shipping_address.building_name = ''
          expect(@buyer_shipping_address).to be_valid
        end
      end

      context '商品購入できない場合' do
        it '郵便番号(postal_code)が空では購入できない' do
          @buyer_shipping_address.postal_code = nil
          @buyer_shipping_address.valid?
          expect(@buyer_shipping_address.errors.full_messages).to include("Postal code can't be blank")
        end
        it '郵便番号(postal_code)は、「3桁ハイフン4桁」の半角文字列出ないと購入できない' do
          @buyer_shipping_address.postal_code = '1234567'
          @buyer_shipping_address.valid?
          expect(@buyer_shipping_address.errors.full_messages).to include('Postal code is invalid. Enter it as follows (e.g. 123-4567)')
        end
        it '都道府県(shipment_source_id)が空では購入できない' do
          @buyer_shipping_address.shipment_source_id = 1
          @buyer_shipping_address.valid?
          expect(@buyer_shipping_address.errors.full_messages).to include("Shipment source can't be blank")
        end
        it '市区町村(municipalities)が空では購入できない' do
          @buyer_shipping_address.municipalities = ''
          @buyer_shipping_address.valid?
          expect(@buyer_shipping_address.errors.full_messages).to include("Municipalities can't be blank")
        end
        it '番地(address)が空では購入できない' do
          @buyer_shipping_address.address = ''
          @buyer_shipping_address.valid?
          expect(@buyer_shipping_address.errors.full_messages).to include("Address can't be blank")
        end
        it '電話番号(phone_number)が空では購入できない' do
          @buyer_shipping_address.phone_number = ''
          @buyer_shipping_address.valid?
          expect(@buyer_shipping_address.errors.full_messages).to include("Phone number can't be blank")
        end
        it '電話番号は、10桁以下では購入できない' do
          @buyer_shipping_address.phone_number = '0901234'
          @buyer_shipping_address.valid?
          expect(@buyer_shipping_address.errors.full_messages).to include('Phone number is too short (minimum is 10 characters)')
        end
        it '電話番号は、11桁以上では購入できない' do
          @buyer_shipping_address.phone_number = '09012345678910'
          @buyer_shipping_address.valid?
          expect(@buyer_shipping_address.errors.full_messages).to include('Phone number is too long (maximum is 11 characters)')
        end
        it '電話番号は、全角数値では購入できない' do
          @buyer_shipping_address.phone_number = '０９０１２３４５６７８'
          @buyer_shipping_address.valid?
          expect(@buyer_shipping_address.errors.full_messages).to include('Phone number is invalid. Input only number')
        end
        it '電話番号は、半角英数字混合では購入できない' do
          @buyer_shipping_address.phone_number = '090abcd5678'
          @buyer_shipping_address.valid?
          expect(@buyer_shipping_address.errors.full_messages).to include('Phone number is invalid. Input only number')
        end
        it 'tokenが空では購入できない' do
          @buyer_shipping_address.token = nil
          @buyer_shipping_address.valid?
          expect(@buyer_shipping_address.errors.full_messages).to include("Token can't be blank")
        end
        it 'user_idが空では購入できない' do
          @buyer_shipping_address.user_id = nil
          @buyer_shipping_address.valid?
          expect(@buyer_shipping_address.errors.full_messages).to include("User can't be blank")
        end
        it 'product_idが空では購入できない' do
          @buyer_shipping_address.product_id = nil
          @buyer_shipping_address.valid?
          expect(@buyer_shipping_address.errors.full_messages).to include("Product can't be blank")
        end
      end
    end
  end
end
