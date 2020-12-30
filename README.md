# アプリケーション名
# 「Inventory」 （棚卸し）
[![Image from Gyazo](https://i.gyazo.com/3fc970e33a8c7c640ada70bbb560e0d1.jpg)](https://gyazo.com/3fc970e33a8c7c640ada70bbb560e0d1)

# 概要
このアプリは飲食店などの棚卸し業務を効率化するアプリです。  
毎月の売り上げ、経費を入力することで、原価率や、粗利が簡単に出力されます。  
また、カレンダー機能を使って、毎月の棚卸しを実施する日や、請求書の締めの日などを、管理することができます。  

# URL

# テスト用アカウント
・email: test@test  
・password: 123abc

# 利用方法
ログインし、月次金額の各項目を入力することで、原価率、粗利、営業利益が自動計算されます。  
入力されたデータが一覧で表示され、確認することができます。  
棚卸しを行う日や、毎月の締め日を入力すると、カレンダーに表示され、色付けされます。  

# 目指した課題解決
・飲食店の棚卸しの数値を一括で管理できるようにする。  
・原価率や粗利を簡単に求められるようにする。  
・毎月の締め日を把握できるようにする。  

# 使用技術
・フレームワーク：Rails6.0.3  
・CSS フレームワーク：Bootstrap  
・サーバーサイド言語：Ruby2.6.6  
・データベース：MySQL  
・ヴァージョン管理：GitHub  
・デプロイ環境：heroku  
・ユーザー管理：devise  
・カレンダー機能：simple_calender  
・グラフ表示：chartkick  
・使用マシン：Mac Catalina(10.15.5)  
・開発期間（約 1 週間）  

# 機能
## ユーザーログイン機能
名前、メールアドレス、パスワードを登録することで、各機能が使えるようになります。  

## 月次金額登録機能
毎月の売り上げや、経費を登録して、一覧表示させることができます。  

## 自動計算機能
食材原価率、粗利、営業利益が自動計算されます。  

## グラフ表示機能
入力した経費の割合がグラフで表示されます。  

## カレンダー機能
カレンダーに、棚卸しを行う日や、毎月の締め日を登録することができます。

# ER図
[![Image from Gyazo](https://i.gyazo.com/17968606ebc6c81c212f03d68f83ac89.png)](https://gyazo.com/17968606ebc6c81c212f03d68f83ac89)

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
