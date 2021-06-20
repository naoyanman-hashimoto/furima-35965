class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]
  before_action :move_to_index, except: [:index, :show, :new, :create]
  before_action :set_product, only: [:edit, :show, :update]

  def index
    @products = Product.all.order('created_at DESC')
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to product_path
    else
      render :edit
    end
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:image, :product_name, :description, :category_id, :status_id, :burden_id,
                                    :shipment_source_id, :time_required_id, :price).merge(user_id: current_user.id)
  end

  def move_to_index
    product = Product.find(params[:id])
    redirect_to action: :index unless current_user.id == product.user_id
  end
end
