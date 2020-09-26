class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :bear_shipping_fee
  belongs_to_active_hash :shipping_from
  belongs_to_active_hash :shipping_within_day

  with_options presence: true do
    validates :image
    validates :name
    validates :description
    validates :sale_price, format: { with: /\A[0-9]+\z/ }, numericality: { greater_than: 300, less_than: 10_000_000 }
  end

  with_options numericality: { other_than: 1 } do
    validates :category_id
    validates :condition_id
    validates :bear_shipping_fee_id
    validates :shipping_from_id
    validates :shipping_within_day_id
  end
end
