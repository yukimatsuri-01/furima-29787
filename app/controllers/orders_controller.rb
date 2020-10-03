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
      @order.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:postal_code, :prefecture_id, :city, :address_line, :building, :phone_number)
  end
  
end
