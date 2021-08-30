# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

# テーブル設計

## users テーブル

| Colum              | Type   | Options                   |
| ---------------    | ------ | ------------------------- |
| nickname           | string | null: false               |
| email              | string | null: false, unique: true |
| encrypted_password | string | null: false               |
| last_name          | string | null: false               |
| first_name         | string | null: false               |
| last_name_kana     | string | null: false               |
| first_name_kana    | string | null: false               |
| birth_year         | string | null: false               |
| birth_month        | string | null: false               |
| birth_day          | string | null: false               |

### Association

- has_many :items
- has_many :purchase_records


## items テーブル

| Colum               | Type   | Options     |
| ------------------- | ------ | ----------- |
| image               | text   | null: false |
| name                | string | null: false |
| description         | text   | null: false |
| category            | string | null: false |
| condition           | string | null: false |
| shipping_cost_payer | string | null: false |
| shipping_area       | string | null: false |
| shipping_days       | string | null: false |
| price               | integer| null: false |

### Association

- belongs_to :user
- has_one    :purchase_records

## purchase_records テーブル

| Colum | Type       | Options |
| ----- | ---------- | ------- |
| user  | references |         |
| item  | references |         |

### Association

- belongs_to :user
- belongs_to :item
- belongs_to :address

## addresses テーブル

| Colum         | Type   | Options     |
| ------------- | ------ | ----------- |
| postal_code   | string | null: false |
| prefecture    | string | null: false |
| city          | string | null: false |
| street_number | string | null: false |
| building      | string | null: false |
| phone_number  | string | null: false |

### Association

- has_many :purchase_records