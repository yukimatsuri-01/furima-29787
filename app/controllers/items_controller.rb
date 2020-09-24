class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)
  end

  private
  def item_params
    params.require(:item).permit(:image, :name, :description, :category_id, :condition_id, :bear_shipping_fee_id, :shipping_from_id, :shipping_within_days_id, :sale_price).merge(user_id: current_user.id)
  end

end
