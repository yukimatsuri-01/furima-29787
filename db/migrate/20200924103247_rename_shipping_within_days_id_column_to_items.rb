class RenameShippingWithinDaysIdColumnToItems < ActiveRecord::Migration[6.0]
  def change
    rename_column :items, :shipping_within_days_id, :shipping_within_day_id
  end
end
