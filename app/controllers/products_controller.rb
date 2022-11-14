class ProductsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  def index
    @products = Product.order(id: 'DESC')
  end

  def new
    @product = Product.new
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
    return if @product.user == current_user

    redirect_to action: :index
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to product_path(@product.id)
    else
      render :edit
    end
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
end
