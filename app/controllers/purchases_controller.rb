class PurchasesController < ApplicationController
  def index
    @purchase_address = PurchaseAddress.new
    @product = Product.find(params[:product_id])
  end

  def create
    @product = Product.find(params[:product_id])
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
                                             :phone_number).merge(user_id: current_user.id,product_id: params[:product_id],token: params[:token])
  end

  def product_params
    params.require(:product).permit(:name,:price,:shipping_charge_id,:image)
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
       Payjp::Charge.create(
         amount: @product.price,
         card: purchase_params[:token],
         currency: 'jpy'
      )
    end

end
