class OrdersController < ApplicationController
  def index  
    @item = Item.find(params[:item_id])
  end

  def pay
  end

  def done
  end

  private

  
end
