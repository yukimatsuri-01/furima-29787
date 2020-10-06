class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.references :user, null: false, foreing_key: true
      t.references :item, null: false, foreing_key: true
      t.timestamps
    end
  end
end
