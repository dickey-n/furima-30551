# テーブル設計

## users テーブル

| Column                | Type   | Options     |
| --------------------- | ------ | ----------- |
| nickname              | string | null: false |
| email                 | string | null: false |
| password              | string | null: false |
| password_confirmation | string | null: false |
| first_name            | string | null: false |
| last_name             | string | null: false |
| first_name_kana       | string | null: false |
| last_name_kana        | string | null: false |
| birthday              | date   | null: false |

### Association

- has_many :items
- has_many :orders

## Items テーブル

| Column          | Type      | Options                        |
| --------------- | --------- | ------------------------------ |
| name            | string    | null: false                    |
| text            | text      | null: false                    |
| categories      | integer   | null: false                    |
| status          | integer   | null: false                    |
| delivery_charge | integer   | null: false                    |
| delivery_area   | integer   | null: false                    |
| day_to_delivery | integer   | null: false                    |
| price           | integer   | null: false                    |
| user            | reference | null: false, foreign_key: true |

### Association

- has_one    :orders
- belongs_to :users

## Orders テーブル

| Column             | Type          | Options                        |
| ------------------ | ------------- | ------------------------------ |
| user               | references    | null: false, foreign_key: true |
| items              | references    | null: false, foreign_key: true |

### Association

- has_one    :shipments
- belongs_to :users
- belongs_to :orders

## Shipment テーブル

| Column        | Type    | Options                        |
| ------------- | ------- | ------------------------------ |
| post_code     | string  | null: false                    |
| prefectures   | integer | null: false                    |
| city_town     | string  | null: false                    |
| address       | string  | null: false                    |
| building_name | string  |                                |
| phone_number  | string  | null: false                    |


### Association

- belongs_to :orders