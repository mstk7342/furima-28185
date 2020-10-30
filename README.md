# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| family_name        | string | null: false |
| first_name         | string | null: false |
| family_name_kana   | string | null: false |
| first_name_kana    | string | null: false |
| birth_day          | date   | null: false |

### Association

- has_many :items
- has_many :buyers

## item テーブル

| Column            | Type    | Options                        |
| name              | string  | null: false                    |
| price             | integer | null: false                    |
| status_id         | integer | null: false                    |
| shipping_cost_id  | integer | null: false                    |
| shipping_days_id  | integer | null: false                    |
| prefectures_id    | integer | null: false                    |
| category_id       | string  | null: false                    |
| description       | text    | null: false                    |
| user_id           | integer | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :buyer

## buyerテーブル

| Column    | Type    | Options                        |
| --------- | ------- | ------------------------------ |
| user_id   | integer | null: false, foreign_key: true |
| item_id   | integer | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :destination

##  destinationテーブル

| Column         | Type    | Options                        |
| -------------- | ------- | ------------------------------ |
| postal_code    | string  | null: false                    |
| prefectures_id | integer | null: false                    |
| city           | string  | null: false                    |
| address        | string  | null: false                    |
| building_name  | string  |                                |
| phone_number   | string  | null: false                    |
| buyer_id       | integer | null: false, foreign_key: true |

### Association

- belongs_to :buyer