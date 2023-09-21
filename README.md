# README

## users テーブル

| Column               | Type    | Options                   |
| -------------------- | ------  | ------------------------- |
| nickname             | string  | null: false               |
| email                | string  | null: false, unique: true |
| encrypted_password   | string  | null: false               |
| last_name            | string  | null: false               |
| first_name           | string  | null: false               |
| last_name_kana       | string  | null: false               |
| first_name_kana      | string  | null: false               |
| date_of_birth        | date    | null: false               | 

### Association

- has_many :items
- has_many :orders


## items テーブル|

| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| product_name         | string     | null: false                    |
| description_of_item  | text       | null: false                    |
| category_id          | integer    | null: false                    |
| condition_id         | integer    | null: false                    |
| shipping_cost_id     | integer    | null: false                    |
| shipping_origin_id   | integer    | null: false                    |
| days_to_ship_id      | integer    | null: false                    |
| price                | integer    | null: false                    |
| user                 | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :order


## orders テーブル
| Column               | Type       | Options                        |
| -------------------- |----------- | ------------------------------ |
| user                 | references | null: false, foreign_key: true | # 購入者
| item                 | references | null: false, foreign_key: true | # 購入品

### Association

- belongs_to :user
- belongs_to :item
- has_one :address


## addresses テーブル

| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| post_code            | string     | null: false                    |
| shipping_origin_id   | integer    | null: false                    |
| municipalities       | string     | null: false                    |
| street_address       | string     | null: false                    |
| building_name        | string     |                                |
| phone_number         | string     | null: false                    |
| order                | references | null: false, foreign_key: true |

### Association

- belongs_to :order