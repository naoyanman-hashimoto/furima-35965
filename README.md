# README
# テーブル設計

## users テーブル

| Column             | Type    | Options     |
| ------------------ | ------- | ----------- |
| nickname           | string  | null: false |
| email              | string  | null: false |
| password           | string  | null: false |
| encrypted_password | string  | null: false |
| name_full_width    | string  | null: false |
| name_half_width    | string  | null: false |
| birthday           | integer | null: false |

### Association

- has_many :items
- has_many :buyers


## products テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| product_code    | text       | null: false                    |
| description     | text       | null: false                    |
| category        | string     | null: false                    |
| status          | string     | null: false                    |
| burden          | string     | null: false                    |
| shipment_source | string     | null: false                    |
| time_required   | string     | null: false                    |
| price           | integer    | null: false                    |
| user            | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :buyer



## buyers テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| user           | references | null: false, foreign_key: true |
| product_code   | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- belongs_to :buyer
- has_one : shipping_address


## shipping_address テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| postal_code    | integer    | null: false                    |
| prefectures    | string     | null: false                    |
| address        | string     | null: false                    |
| Building name  | string     |                                |
| phone_number   | integer    | null: false                    |

### Association

- belongs_to :buyer
