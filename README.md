# README
# テーブル設計

## users テーブル

| Column             | Type    | Options                   |
| ------------------ | ------- | ------------------------- |
| nickname           | string  | null: false               |
| email              | string  | null: false, unique: true |
| encrypted_password | string  | null: false               |
| first_name         | string  | null: false               |
| last_name          | string  | null: false               |
| kana_first_name    | string  | null: false               |
| kana_last_name     | string  | null: false               |
| date               | integer | null: false               |

### Association

- has_many :items
- has_many :buyers


## products テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| product_name       | string     | null: false                    |
| description        | text       | null: false                    |
| category_id        | integer    | null: false                    |
| status_id          | integer    | null: false                    |
| burden_id          | integer    | null: false                    |
| shipment_source_id | integer    | null: false                    |
| time_required_id   | integer    | null: false                    |
| price              | integer    | null: false                    |
| user               | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :buyer



## buyers テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| user           | references | null: false, foreign_key: true |
| product_name   | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- belongs_to :product
- has_one : shipping_address


## shipping_address テーブル

| Column             | Type       | Options                        |
| ------------------ | ---------- | ------------------------------ |
| postal_code        | string     | null: false                    |
| shipment_source_id | integer    | null: false                    |
| address            | string     | null: false                    |
| building name      | string     |                                |
| phone_number       | string     | null: false                    |

### Association

- belongs_to :buyer
