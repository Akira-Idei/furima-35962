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
| birthday           | date   | null: false               |

### Association

- has_many :items
- has_many :purchase_records


## items テーブル

| Colum                  | Type      | Options          |
| ---------------------- | --------- | -----------------|
| name                   | string    | null: false      |
| description            | text      | null: false      |
| category_id            | integer   | null: false      |
| condition_id           | integer   | null: false      |
| shipping_cost_payer_id | integer   | null: false      |
| prefecture_id          | integer   | null: false      |
| shipping_days_id       | integer   | null: false      |
| price                  | integer   | null: false      |
| user                   | references| foreign_key: true|

### Association

- belongs_to :user
- has_one    :purchase_record

## purchase_records テーブル

| Colum   | Type       | Options           |
| ------- | ---------- | ----------------- |
| user    | references | foreign_key: true |
| item    | references | foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one    :address

## addresses テーブル

| Colum           | Type      | Options           |
| --------------- | --------- | ----------------- |
| postal_code     | string    | null: false       |
| prefecture_id   | integer   | null: false       |
| city            | string    | null: false       |
| street_number   | string    | null: false       |
| building        | string    |                   |
| phone_number    | string    | null: false       |
| purchase_record | references| foreign_key: true |

### Association

- belongs_to :purchase_record