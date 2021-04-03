# README

## users テーブル

| Column            | Type    | Options     |
| ----------------- | ------- | ----------- |
| nickname          | string  | null: false |
| email             | string  | null: false |
| password          | string  | null: false |
| last_name         | string  | null: false |
| first_name        | string  | null: false |
| last_name_kana    | string  | null: false |
| first_name_kana   | string  | null: false |
| birthday_year_id  | integer | null: false |
| birthday_month_id | integer | null: false |
| birthday_day_id   | integer | null: false |

### Association

- has_many :items
- has_many :buys
- belongs_to :birthday





## items テーブル

| Column              | Type       | Options                        |
| ------------------- | ---------- | ------------------------------ |
| title               | string     | null: false                    |
| text                | text       | null: false                    |
| goods_category_id   | string     | null: false                    |
| goods_condition_id  | string     | null: false                    |
| shipping_charges_id | string     | null: false                    |
| shipping_area_id    | string     | null: false                    |
| shipping_days_id    | string     | null: false                    |
| price               | integer    | null: false                    |
| users               | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- belongs_to :buys
- belongs_to :goods
- belongs_to :shipping





## buys テーブル

| Column            | Type       | Options                        |
| ----------------- | ---------- | ------------------------------ |
| creditcard_number | integer    | null: false                    |
| exp_month         | integer    | null: false                    |
| exp_year          | integer    | null: false                    |
| security_code     | integer    | null: false                    |
| users             | references | null: false, foreign_key: true |
| items             | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- belongs_to :items





## shipping_address テーブル

| Column        | Type       | Options                        |
| ------------- | ---------- | ------------------------------ |
| postal_code   | integer    | null: false                    |
| prefecture_id | string     | null: false                    |
| city          | string     | null: false                    |
| address       | string     | null: false                    |
| building_name | string     |                                |
| phone_number  | integer    | null: false                    |
| buys          | references | null: false, foreign_key: true |

### Association

- belongs_to :buys
