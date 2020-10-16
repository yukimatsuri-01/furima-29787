class Order < ApplicationRecord
  belongs_to :item
  belongs_to :user
  belongs_to :address

  validates :token, presence: true
end
