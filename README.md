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
|name|string|null: false|
|email|string|null: false, unique: true|
|password|string|null: false|
|updated_at|timestamp|null: false|
|created_at|timestamp|null: false|
### Association
- has_one: snscredential, dependent: :destroy
- has_one: sendaddress, dependent: :destroy
- has_one: personal, dependent: :destroy
- has_one: creditcard, dependent: :destroy
- has_many: products, through: :favorites, dependent: :destroy
- has_many: products, through: :comments, dependent: :destroy
- has_many: evaluations, dependent: :destroy
- has_many: buyer_products, class_name: 'User', foreign_key: 'buyer_id', dependent: :destroy
- has_many: seller_products, class_name: 'User', foreign_key: 'seller_id', dependent: :destroy

### Personalsテーブル
|Column|Type|Options|
|------|----|-------|
|birthday|date|null: false|
|firstname|string|null: false|
|lastname|string|null: false|
|h_firstname|string|null: false|
|h_lastname|string|null: false|
|image|string||
|description|string||
|updated_at|timestamp|null: false|
|created_at|timestamp|null: false|
|user_id|references|null: false, foreign_key: true|
### Association
- belongs_to: user

### SendAddressesテーブル
|Column|Type|Options|
|------|----|-------|
|s_firstname|string|null: false|
|s_lastname|string|null: false|
|s_h_firstname|string|null: false|
|s_h_lastname|string|null: false|
|prefectures|string|null: false|
|municipalitities|string|null: false|
|zipcode|string|null: false|
|streetaddress|string|null: false|
|room|string||
|phonenumber|string|null: false|
|updated_at|timestamp|null: false|
|created_at|timestamp|null: false|
|user_id|references|null: false, foreign_key: true|
### Association
- belongs_to: user

### Creditcardsテーブル
|Column|Type|Options|
|------|----|-------|
|customer_id|string|null: false, unique: true|
|token|string||
|user_id|references|null: false, foreign_key: true|
|updated_at|timestamp|null: false|
|created_at|timestamp|null: false|
### Association
- belongs_to: user

### Favoritesテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|products_id|references|null: false, foreign_key: true|
|created_at|timestamp|null: false|
|updated_at|timestamp|null: false|
### Association
- belongs_to: user
- belongs_to: product

### Commentsテーブル
|Column|Type|Options|
|------|----|-------|
|content|text|null: false|
|user_id|references|null: false, foreign_key: true|
|products_id|references|null: false, foreign_key: true|
|created_at|timestamp|null: false|
|updated_at|timestamp|null: false|
### Association
- belongs_to: user
- belongs_to: product

### SnsCredentialsテーブル
|Column|Type|Options|
|------|----|-------|
|provider|string|null: false|
|uid|string|null: false, unique: true|
|token|string||
|user_id|references|null: false, foreign_key: true|
### Association
- belongs_to: user

### Productsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|price|integer|null: false|
|discription|text|null: false|
|category_id|references|null: false, foreign_key: true|
|brand_id|integer||
|size_id|integer||
|status_id|integer|null: false|
|shipfee_id|integer|null: false|
|shipregion_id|integer|null: false|
|estshipdate_id|integer|null: false|
|buyer_id|references|foreign_key: {to_table: :users}|
|seller_id|references|null: false, foreign_key: {to_table: :users}|
|draft|integer|null: false, default: 0|
|updated_at|timestamp|null: false|
|created_at|timestamp|null: false|
### Association
- has_many: comments, through: :users, dependent: :destroy
- has_many: favorites, through: :users, dependent: :destroy
- has_many: images, dependent: :destroy
- has_one: evalution, deendent: :destroy
- belongs_to: buyer, class_name: 'User', foreign_key: 'buyer_id'
- belongs_to: seller, class_name: 'User', foreign_key: 'seller_id'
- belongs_to_active_hash: categories
- belongs_to_active_hash: brands
- belongs_to_active_hash: sizes
- belongs_to_active_hash: statues
- belongs_to_active_hash: shipfees
- belongs_to_active_hash: shipregions
- belongs_to_active_hash: estshipdate

### Evaluationsテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|references|null: false, foreign_key: true|
|item_id|references|null: false, foreign_key: true|
|evaluation_id|integer|null: false|
|review|text||
|created_at|timestamp|null: false|
|updated_at|timestamp|null: false|
### Association
- belongs_to_active_hash: evaluationsname
- belongs_to: user
- belongs_to: product

### EvaluationNamesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
### Association
- has_many: evaluations

### Imagesテーブル
|Column|Type|Options|
|------|----|-------|
|url|string|null: false|
|created_at|timestamp|null: false|
|updated_at|timestamp|null: false|
|product_id|integer|null: false, foreign_key: true|
### Association
- belongs_to: product

### Categoryテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|parent_id|integer||
|created_at|timestamp|null: false|
|updated_at|timestamp|null: false|
### Association
- has_many: products

### Brandsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
### Association
- has_many: products

### Sizesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
### Association
- has_many: products

### Statuesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
### Association
- has_many: products

### Shipfeesテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
### Association
- has_many: products

### Shipregionsテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
### Association
- has_many: products

### Estshipdateテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
### Association
- has_many: products