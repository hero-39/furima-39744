# README

## users テーブル

| Column               | Type    | Options     |
| -------------------- | ------  | ----------- |
| nickname             | string  | null: false |
| email                | string  | null: false |
| password             | string  | null: false |
| last_name            | string  | null: false |
| first_name           | string  | null: false |
| last_name(カナ)       | string  | null: false |
| first_name(カナ)      | string  | null: false |
| data of birth(年)    | integer | null: false |
| data of birth(月)    | integer | null: false |
| data of birth(日)    | integer | null: false |  

### Association

- has_many :items
- has_many :buys


## items テーブル|

| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| product name         | string     | null: false                    |
| description of item  | text       | null: false                    |
| category             | string     | null: false                    |
| condition            | string     | null: false                    |
| shipping cost        | string     | null: false                    |
| shipping origin      | string     | null: false                    |
| days to ship         | integer    | null: false                    |
| price                | integer    | null: false                    |
| sales commission     | integer    | null: false                    |
| sales profit         | integer    | null: false                    |
| user_id              | references | null: false, foreign_key: true |
| buy_id               | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- belongs_to :buys


## orders テーブル
| Column               | Type       | Options                        |
| -------------------- |----------- | ------------------------------ |
| orders               | string     | null: false                    |
| user_id              | references | null: false, foreign_key: true |
| item_id              | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- has_many :items
- has_one :buy_user


## buy_user テーブル

| Column               | Type       | Options                        |
| -------------------- | ---------- | ------------------------------ |
| post code            | integer    | null: false                    |
| prefecture           | string     | null: false                    |
| municipalities       | string     | null: false                    |
| banchi               | string     | null: false                    |
| building name        | string     | null: false                    |
| phone number         | integer    | null: false                    |
| user_id              | references | null: false, foreign_key: true |

### Association

- belongs_to :orders