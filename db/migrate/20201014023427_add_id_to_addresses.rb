class AddIdToAddresses < ActiveRecord::Migration[6.0]
  def change
    add_reference :addresses, :user
    remove_reference :addresses, :order
    Address.create(postal_code: 874-0044, prefecture_id: 45, city: "別府", address_line: 1-1, building: "beppuビル", phone_number: 09011112222, user_id: 1)
    Address_reset_column_information
  end
end
