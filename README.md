# アプリケーション名
# 「Inventory」 （棚卸し）

# 概要
このアプリは棚卸しを効率化するアプリです。  
毎月の売り上げ、経費を入力することで、原価率や、粗利が簡単に出力されます。  
また、カレンダー機能を使って、毎月の棚卸しを実施する日や、請求書の締めの日などを、管理することができます。  

# URL

# テスト用アカウント

# 利用方法

# 目指した課題解決

# 使用技術

# 機能

# 実装予定の機能

# ER図

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

## events テーブル

| Column     | Type     | Options |
| ---------- | -------- | ------- |
| title      | string   |         |
| content    | text     |         |
| start_time | datetime |         |

### Association

- belongs_to :user
