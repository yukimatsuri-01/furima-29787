# テーブル設計

## users テーブル

| Column        | Type    | Options     |
| ------------- | ------- | ----------- |
| name          | string  | null: false |
| email         | string  | null: false |
| password      | string  | null: false |
| name_kanji    | string  | null: false |
| name_katakana | string  | null: false |
| birth_day     | integer | null: false |

### Asociation
- has_many :items
- has_many :buys

## items テーブル

| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| name                 | string     | null: false                    |
| description          | string     | null: false                    |
| category             | string     | null: false                    |
| condition            | string     | null: false                    |
| bear_shipping_fee    | integer    | null: false                    | 
| shipping_within_days | string     | null: false                    | 
| sale_price           | integer    | null: false                    |
| user                 | references | null: false, foreing_key: true |
| buy                  | references | null: false, foreing_key: true |

### Asociation
- belongs_to :users
- belongs_to :buys

## buys テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- |------------------------------- |
| card_information | integer    | null: false                    | 
| expiration_date  | integer    | null: false                    | 
| security_code    | integer    | null: false                    | 
| user             | references | null: false, foreing_key: true |

### Asociation
- has_many :items
- belongs_to :users
- has_one :transactions

## transactions テーブル

| Column       | Type    | Options     |
| ------------ | ------- | ----------- |
| postal_code  | integer | null: false |
| prefecture   | integer | null: false |
| city         | integer | null: false |
| address_line | integer | null: false |
| building     | integer |             |
| phone_number | integer | null: false |

### Asociation
- belongs_to :buys
