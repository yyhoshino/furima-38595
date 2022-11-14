class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_product, only: [:edit, :update, :show ,:destroy]
  before_action :set_products, only: [:edit, :destroy]
  def index
    @products = Product.order(id: 'DESC')
  end

  def new
    @product = Product.new
  end

  def show
  end

  def edit
  end

  def update
    if @product.update(product_params)
      redirect_to product_path(@product.id)
    else
      render :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to root_path
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
    params.require(:product).permit(:name, :description, :price, :category_id, :condition_id, :shipping_charge_id, :prefecture_id,
                                    :shipping_day_id, :image).merge(user_id: current_user.id)
  end

  def set_product
    @product = Product.find(params[:id])
  end

  def set_products
    unless @product.user == current_user
      redirect_to action: :index
    end
  end
  
end
