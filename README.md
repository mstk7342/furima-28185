# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| email    | string | null: false |
| password | string | null: false |

### Association

- has_many :users
- has_many :buyer

## item テーブル

| Column  | Type   | Options                         |
| ------  | ------ | ------------------------------- |
| name    | string | null: false                     |
| price   | string | null: false                     |
| user_id | string | null: false,  foreign_key: true |


### Association

- belongs_to :users
- has_one :buyer

## buyerテーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user_id   | references | null: false, foreign_key: true |
| item_id   | references | null: false, foreign_key: true |

### Association

- belongs_to :items
- has_one :postal

## postal テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | string     | null: false                    |
| prefectures   | references | null: false                    |
| city          | references | null: false                    |
| address       | references | null: false                    |
| buyer         | references | null: false, foreign_key: true |

### Association

- belongs_to :buyer