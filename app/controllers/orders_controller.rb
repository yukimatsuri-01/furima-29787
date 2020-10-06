class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item_id, only: [:index, :create, :move_to_index]
  before_action :move_to_index

  def index  
    @order = OrderAddress.new
  end

  def create
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

  def set_item_id
    @item = Item.find(params[:item_id])
  end

  def move_to_index
    redirect_to root_path if @order || current_user.id == @item.user_id
  end
end
