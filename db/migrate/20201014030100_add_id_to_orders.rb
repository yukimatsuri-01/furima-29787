class AddIdToOrders < ActiveRecord::Migration[6.0]
  def change
    add_reference :orders, :address, foreign_key: true
  end
end
