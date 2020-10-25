# テーブル設計

## users テーブル

| Column           | Type   | Options     |
| ---------------- | ------ | ----------- |
| nickname         | string | null: false |
| email            | string | null: false |
| password         | string | null: false |
| re_password      | string | null: false |
| family_name      | string | null: false |
| first_name       | string | null: false |
| family_name_kana | string | null: false |
| first_name_kana  | string | null: false |
| birth_day        | date   | null: false |

### Association

- has_many :items
- has_one :buyer

## item テーブル

| Column        | Type    | Options                        |
| ------------- | ------- | ------------------------------ |
| name          | string  | null: false                    |
| price         | string  | null: false                    |
| status        | string  | null: false                    |
| shipping_cost | string  | null: false                    |
| shipping_days | string  | null: false                    |
| prefectures   | string  | null: false                    |
| category      | string  | null: false                    |
| item_image    | string  | null: false                    |
| description   | string  | null: false                    |
| user_id       | integer | null: false, foreign_key: true |

### Association

- belongs_to :users
- has_one :buyer

## buyerテーブル

| Column    | Type    | Options                        |
| --------- | ------- | ------------------------------ |
| user_id   | integer | null: false, foreign_key: true |
| item_id   | integer | null: false, foreign_key: true |
| time      | string  |                                |

### Association

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
| user_id        | integer | null: false, foreign_key: true |

### Association

- belongs_to :buyer