class ProductsController < ApplicationController
  def index
  end

  private
  def prototype_params
    params.require(:product).permit(:image).merge(user_id: current_user.id)
  end
end
