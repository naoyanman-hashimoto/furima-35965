class ProductsController < ApplicationController
  def index
  end

  def new
    @product = Product.new
  end

  def create
    # binding.pry
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def product_params
    params.require(:product).permit(:image, :product_name, :description, :category_id, :status_id, :burden_id, :shipment_source_id, :time_required_id, :price).merge(user_id: current_user.id)
  end
end
