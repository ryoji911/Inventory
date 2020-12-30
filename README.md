# テーブル設計

## users テーブル

| Column   | Type   | Options     |
| -------- | ------ | ----------- |
| name     | string | null: false |
| email    | string | null: false |
| password | string | null: false |

### Association

- has_many :costs

## costs テーブル

| Column         | Type    | Options     |
| -------------- | ------- | ----------- |
| sale           | integer | null: false |
| food_cost      | integer | null: false |
| utility_cost   | integer | null: false |
| labor_cost     | integer | null: false |
| rent           | integer | null: false |
| supply         | integer | null: false |
| other          | integer |             |
| inventory      | integer | null: false |
| last_inventory | integer | null: false |
| user        | references | null: false, foreign_key: true |

### Association

- belongs_to :user

