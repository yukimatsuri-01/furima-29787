class Address < ApplicationRecord
  belongs_to :order
  belongs_to_active_hash :prefecture_id
end
