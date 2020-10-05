class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index  
    
    @item = Item.find(params[:item_id])
    @order = OrderAddress.new
    redirect_to root_path if current_user.id == @item.user_id
  end

  def create
    @item = Item.find(params[:item_id])
    @order = OrderAddress.new(order_params)
    if @order.valid?
      pay_item
      @order.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:postal_code, :prefecture_id, :city, :address_line, :building, :phone_number).merge(token: params[:token], user_id: current_user.id, item_id: params[:item_id], order_id: params[:order_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.sale_price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end
  
end
