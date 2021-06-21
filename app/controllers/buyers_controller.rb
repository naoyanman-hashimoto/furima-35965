class BuyersController < ApplicationController
  before_action :set_product, only: [:index, :create]

  def index
    @buyer_shipping_address = BuyerShippingAddress.new
  end

  def create
    @buyer_shipping_address = BuyerShippingAddress.new(buyer_params)
    if @buyer_shipping_address.valid?
      @buyer_shipping_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def set_product
    @product = Product.find(params[:product_id])
  end

  def buyer_params
    params.require(:buyer_shipping_address).permit(:postal_code, :shipment_source_id, :municipalities, :address, :building_name, :phone_number).merge(user_id: current_user.id,product_id: @product.id)
  end
end
