FactoryBot.define do
  factory :item do
    name { 'flower' }
    description { Faker::Lorem.sentence }
    sale_price { '1000' }
    category_id { '2' }
    condition_id { '2' }
    bear_shipping_fee_id { '2' }
    shipping_from_id { '2' }
    shipping_within_day_id { '2' }
    association :user
  end
end
