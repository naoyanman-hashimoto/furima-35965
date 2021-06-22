class BuyerShippingAddress
  include ActiveModel::Model
  attr_accessor :postal_code, :shipment_source_id, :municipalities, :address, :building_name, :phone_number, :user_id,
                :product_id, :token

  with_options presence: true do
    validates :postal_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Enter it as follows (e.g. 123-4567)' }
    validates :shipment_source_id, numericality: { other_than: 1, message: "can't be blank" }
    validates :municipalities
    validates :address
    validates :phone_number, length: { maximum: 11, minimum: 11 },
                             format: { with: /\A[0-9]+\z/, message: 'is invalid. Input only number' }
    validates :user_id
    validates :product_id
    validates :token
  end

  def save
    buyer = Buyer.create(user_id: user_id, product_id: product_id)
    ShippingAddress.create(postal_code: postal_code, shipment_source_id: shipment_source_id, municipalities: municipalities,
                           address: address, phone_number: phone_number, buyer_id: buyer.id)
  end
end
