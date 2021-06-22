class BuyersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_product, only: [:index, :create]
  before_action :move_to_index, only: [:index, :create]
  before_action :redirect_to_index, only: [:index, :create]

  def index
    @buyer_shipping_address = BuyerShippingAddress.new
  end

  def create
    @buyer_shipping_address = BuyerShippingAddress.new(buyer_params)
    if @buyer_shipping_address.valid?
      pay_product
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
    params.require(:buyer_shipping_address)
          .permit(:postal_code, :shipment_source_id, :municipalities, :address, :building_name, :phone_number)
          .merge(user_id: current_user.id, product_id: @product.id, token: params[:token])
  end

  def pay_product
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @product[:price],
      card: buyer_params[:token],
      currency: 'jpy'
    )
  end

  def move_to_index
    redirect_to root_path if current_user.id == @product.user_id
  end

  def redirect_to_index
    redirect_to root_path if @product.buyer.present?
  end
end
