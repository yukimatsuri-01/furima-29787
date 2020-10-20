class AddIdToAddresses < ActiveRecord::Migration[6.0]
  def change
    add_reference :addresses, :user
    remove_reference :addresses, :order
    Address_reset_column_information
  end
end
