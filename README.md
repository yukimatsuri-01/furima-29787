# テーブル設計

## users テーブル

| Column                | Type    | Options     |
| --------------------- | ------- | ----------- |
| nickname              | string  | null: false |
| email                 | string  | null: false |
| password              | string  | null: false |
| family_name_kanji     | string  | null: false |
| first_name_kanji      | string  | null: false |
| family_name_katakana  | string  | null: false |
| first_name_katakana   | string  | null: false |
| birth_day             | date    | null: false |

### Asociation
- has_many :items
- has_many :item_purchases

## items テーブル

| Column                  | Type       | Options                        |
| ----------------------- | ---------- | ------------------------------ |
| name                    | string     | null: false                    |
| description             | string     | null: false                    |
| category                | string     | null: false                    |
| condition_id            | integer    | null: false                    |
| bear_shipping_fee_id    | integer    | null: false                    | 
| shipping_from_id        | integer    | null: false                    | 
| shipping_within_days_id | integer    | null: false                    | 
| sale_price              | integer    | null: false                    |
| user                    | references | null: false, foreing_key: true |
| buy                     | references | null: false, foreing_key: true |

### Asociation
- belongs_to :users
- belongs_to :item_purchases
- belongs_to_active_hash :condition
- belongs_to_active_hash :bear_shipping_fee_id
- belongs_to_active_hash :shipping_from_id
- belongs_to_active_hash :shipping_within_days_id

## item_purchases テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- |------------------------------- | 
| user             | references | null: false, foreing_key: true |
| item             | references | null: false, foreing_key: true |

### Asociation
- belongs_to :items
- belongs_to :users
- has_one :addresses

## addresses テーブル

| Column       | Type    | Options     |
| ------------ | ------- | ----------- |
| postal_code  | integer | null: false |
| prefecture   | integer | null: false |
| city         | integer | null: false |
| address_line | integer | null: false |
| building     | integer |             |
| phone_number | integer | null: false |

### Asociation
- belongs_to :item_purchases
