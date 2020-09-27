class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.text :description, null: false
      t.integer :category_id, null: false
      t.integer :condition_id, null: false
      t.integer :bear_shipping_fee_id, null: false
      t.integer :shipping_from_id , null: false
      t.integer :shipping_within_days_id, null: false
      t.integer :sale_price, null: false
      t.references :user, null: false, foreing_key: true
      t.timestamps
    end
  end
end
