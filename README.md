# テーブル設計

## users テーブル

| Column                | Type    | Options     |
| --------------------- | ------- | ----------- |
| nickname              | string  | null: false |
| email                 | string  | null: false |
| encrypted_password    | string  | null: false |
| family_name_kanji     | string  | null: false |
| first_name_kanji      | string  | null: false |
| family_name_katakana  | string  | null: false |
| first_name_katakana   | string  | null: false |
| birth_day             | date    | null: false |

### Asociation
- has_many :items
- has_many :orders

## items テーブル

| Column                  | Type       | Options                        |
| ----------------------- | ---------- | ------------------------------ |
| name                    | string     | null: false                    |
| description             | text       | null: false                    |
| category_id             | integer    | null: false                    |
| condition_id            | integer    | null: false                    |
| bear_shipping_fee_id    | integer    | null: false                    | 
| shipping_from_id        | integer    | null: false                    | 
| shipping_within_day_id  | integer    | null: false                    | 
| sale_price              | integer    | null: false                    |
| user                    | references | null: false, foreing_key: true |

### Asociation
- belongs_to :user
- has_one :order
- belongs_to_active_hash :category
- belongs_to_active_hash :condition
- belongs_to_active_hash :bear_shipping_fee_id
- belongs_to_active_hash :shipping_from_id
- belongs_to_active_hash :shipping_within_day_id


## orders テーブル

| Column           | Type       | Options                        |
| ---------------- | ---------- |------------------------------- | 
| user             | references | null: false, foreing_key: true |
| item             | references | null: false, foreing_key: true |

### Asociation
- belongs_to :item
- belongs_to :user
- has_one :address

## addresses テーブル

| Column        | Type       | Options                        |
| ------------  | -------    | -----------                    |
| postal_code   | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| city          | string     | null: false                    |
| address_line  | string     | null: false                    |
| building      | string     |                                |
| phone_number  | string     | null: false                    |
| order         | references | null: false, foreing_key: true |

### Asociation
- belongs_to :order
- belongs_to_active_hash :prefecture_id
