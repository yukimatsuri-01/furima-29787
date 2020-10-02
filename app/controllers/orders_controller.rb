class OrdersController < ApplicationController
  def index  
    @item = Item.find(params[:item_id])
    @order = OrderAddress.new
  end

  def create
    binding.pry
    @order = OrderAddress.new(order_params)
    if @order.valid?
      @order.save
      return redirect_to root_path
    else
      redirect_to item_orders_path
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:postal_code, :prefecture_id, :city, :address_line, :building, :phone_number, :user_id, :item_id, :order_id)
  end
  
end
