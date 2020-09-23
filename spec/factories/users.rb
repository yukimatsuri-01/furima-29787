FactoryBot.define do
  factory :user do
    nickname { 'Taro' }
    email { Faker::Internet.free_email }
    password { 'taro1234' }
    password_confirmation { password }
    family_name_kanji { '山田' }
    first_name_kanji { '太郎' }
    family_name_katakana { 'ヤマダ' }
    first_name_katakana { 'タロウ' }
    birth_day { Faker::Date.birthday }
  end
end
