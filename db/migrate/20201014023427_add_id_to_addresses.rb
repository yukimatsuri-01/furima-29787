class AddIdToAddresses < ActiveRecord::Migration[6.0]
  def change
    add_reference :addresses, :user

  end
end
