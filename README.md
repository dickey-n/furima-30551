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

| Column             | Type      | Options                        |
| ---------------    | --------- | ------------------------------ |
| name               | string    | null: false                    |
| text               | text      | null: false                    |
| category_id        | integer   | null: false                    |
| status_id          | integer   | null: false                    |
| delivery_charge_id | integer   | null: false                    |
| delivery_area_id   | integer   | null: false                    |
| day_to_delivery_id | integer   | null: false                    |
| price              | integer   | null: false                    |
| user               | reference | null: false, foreign_key: true |

### Association

- has_one    :order
- belongs_to :user

## Orders テーブル

| Column             | Type          | Options                        |
| ------------------ | ------------- | ------------------------------ |
| user               | references    | null: false, foreign_key: true |
| item               | references    | null: false, foreign_key: true |

### Association

- has_one    :shipment
- belongs_to :user
- belongs_to :item

## Shipment テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| post_code     | string     | null: false                    |
| prefecture_id | integer    | null: false                    |
| city_town     | string     | null: false                    |
| address       | string     | null: false                    |
| building_name | string     |                                |
| phone_number  | string     | null: false                    |
| order         | references | null: false, foreign_key: true |


### Association

- belongs_to :order