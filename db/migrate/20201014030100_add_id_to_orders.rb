class AddIdToOrders < ActiveRecord::Migration[6.0]
  def change
    remove_reference :orders, :address
    Order.reset_column_information
  end
end
