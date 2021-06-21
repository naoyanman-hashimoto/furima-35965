class BuyersController < ApplicationController
  def index
    @product = Product.find(params[:product_id])
  end

  def new
  end

  def create
    @buyer = Buyer.create(buyer_params)
    ShippingAddress.create(shipping_address_params)
    redirect_to root_path
  end

  private

  def buyer_params
    params.permit(:user_id, :product_id).merge(user_id: current_user.id)
  end

  def shipping_address_params
    params.permit(:postal_code, :shipment_source_id, :municipalities, :address, :building_name, :phone_number).merge(buyer_id: @buyer.id)
  end
end
