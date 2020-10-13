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
| name            | text      | null: false                    |
| text            | text      | null: false                    |
| categories      | string    | null: false                    |
| status          | string    | null: false                    |
| delivery_charge | string    | null: false                    |
| delivery_area   | string    | null: false                    |
| day_to_delivery | string    | null: false                    |
| price           | integer   | null: false                    |
| user            | reference | null: false, foreign_key: true |

### Association

- has_one    :orders
- belongs_to :users

## Orders テーブル

| Column             | Type          | Options                        |
| ------------------ | ------------- | ------------------------------ |
| credit_card_number | integer       | null: false                    |
| expiration_date    | integer       | null: false                    |
| security_code      | integer       | null: false                    |
| user               | references    | null: false, foreign_key: true |
| items              | references    | null: false, foreign_key: true |

### Association

- has_one    :shipments
- belongs_to :users
- belongs_to :orders

## Shipment テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| post_code     | integer    | null: false                    |
| prefectures   | string     | null: false                    |
| city_town     | string     | null: false                    |
| address       | text       | null: false                    |
| building_name | text       |                                |
| phone_number  | integer    | null: false                    |
| order         | references | null: false, foreign_key: true |


### Association

- belongs_to :orders