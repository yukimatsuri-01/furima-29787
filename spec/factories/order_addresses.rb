FactoryBot.define do
  factory :order_address do
    postal_code { '123-4567' }
    prefecture_id {2}
    city { '福岡県' }
    address_line {'福岡市中央区1-1'}
    building {''}
    phone_number {'08067367228'}
    token {'tok_abcdefghijk00000000000000000'}
  end
end
