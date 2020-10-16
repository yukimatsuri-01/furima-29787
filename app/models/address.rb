class Address < ApplicationRecord
  belongs_to :user, optional: true 
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture
  
  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
    validates :prefecture_id, numericality: { other_than: 1}
    validates :city
    validates :address_line
    validates :phone_number, format: {with: /\A[0-9]{11}\z/}
  end
end
