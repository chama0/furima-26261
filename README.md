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

# furima-26261 DB設計

### Usersテーブル
|Column|Type|Options|
|------|----|-------|
|nickname|string|null: false|
|email|string|null: false, unique: true|
|password|string|null: false|
|firstname|string|null: false|
|lastname|string|null: false|
|firstname_reading|string|null: false|
|lastname_reading|string|null: false|
|birthday|date|null: false|
### Association
- has_many: items
- has_many: purchases

### Itemsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|description|text|null: false|
|category_id|integer|null: false|
|status_id|integer|null: false|
|shipfee_id|integer|null: false|
|shipregion_id|integer|null: false|
|estshipdate_id|integer|null: false|
|price|integer|null: false|
|user|references|null: false, foreign_key: true|
### Association
- belongs_to: user
- has_one: purchase

### Addressesテーブル
|Column|Type|Options|
|------|----|-------|
|zipcode|string|null: false|
|prefecture_id|integer|null: false|
|municipalities|string|null: false|
|house_number|string|null: false|
|building_name|string||
|phone_number|string|null: false|
|purchase|references|null: false, foreign_key: true|
### Association
- belongs_to: purchase

### Purchasesテーブル
|Column|Type|Options|
|------|----|-------|
|user|references|null: false, foreign_key: true|
|item|references|null: false, foreign_key: true|
### Association
- belongs_to: user
- belongs_to: item
- has_one: address