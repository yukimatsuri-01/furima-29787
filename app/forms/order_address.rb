class OrderAddress

  include ActiveModel::Model
  attr_accessor :postal_code, :prefecture_id, :city, :address_line, :building, :phone_number

  with_options presence: true do
    validates :postal_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/}
    validates :city
    validates :address_line
    validates :phone_number, format: {with: /\A[0-9]{11}\z/}
  end

  validates :prefecture_id, numericality: { other_than: 1}

  def save
    user = User.create(
      nickname: nickname, 
      family_name_kanji: family_name_kanji, 
      first_name_kanji: first_name_kanji, 
      family_name_katakana: family_name_katakana, 
      first_name_katakana: first_name_katakana, 
      birth_day: birth_day, password: password)
    item = Item.create(
      name: name, 
      description: description, 
      category_id: category_id, 
      condition_id: condition_id, 
      bear_shipping_fee_id: bear_shipping_fee_id, 
      shipping_from_id: shipping_from_id, 
      shipping_within_day_id: shipping_within_day_id, 
      sale_price: sale_price, 
      user_id: user.id)
    order = Order.createe(
      user_id: user.id, 
      item_id: item.id)
    Address.create(
      postal_code: postal_code, 
      prefecture_id: prefecture_id, 
      city: city, 
      address_line: address_line, 
      building: building, 
      phone_number: phone_number, 
      order_id: order.id)
  end
end