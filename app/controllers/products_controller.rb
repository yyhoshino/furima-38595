class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index,:show]
  def index
    @products = Product.order(id: "DESC" )
  end

  def new
    @product = Product.new
  end

  def show
    @product = Product.find(params[:id])
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to root_path
    else
    render :new
    end
  end


  private

  def product_params
    params.require(:product).permit(:name,:description,:price,:category_id,:condition_id,:shipping_charge_id,:prefecture_id,:shipping_day_id,:image).merge(user_id: current_user.id)
  end
end
