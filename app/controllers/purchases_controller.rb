class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :set_product, only: [:index, :create]
  def index
    @purchase_address = PurchaseAddress.new
    return unless @product.user_id == current_user.id || !@product.purchase.nil?

    redirect_to root_path
  end

  def create
    @purchase_address = PurchaseAddress.new(purchase_params)
    if @purchase_address.valid?
      pay_item
      @purchase_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def purchase_params
    params.require(:purchase_address).permit(:post_code, :prefecture_id, :city, :address, :building_name,
                                             :phone_number).merge(user_id: current_user.id, product_id: params[:product_id], token: params[:token])
  end

  def product_params
    params.require(:product).permit(:name, :price, :shipping_charge_id, :image, :user_id)
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @product.price,
      card: purchase_params[:token],
      currency: 'jpy'
    )
  end

  def set_product
    @product = Product.find(params[:product_id])
  end
end
