# README

## usersテーブル

|Column            |Type   |Options             |
|------------------|-------|--------------------|
|name              |string |null: false,        |
|email             |string |null: false,        |
|encrypted_password|string |null: false,        |
|first_name        |string |null: false,        |
|last_name         |string |null: false,        |
|first_name_kana   |string |null: false,        |
|last_name_kana    |string |null: false,        |
|birthday          |date   |null: false,        |


### Association
has_many　:products dependent: :destroy
has_one :purchase

## purchaseテーブル

|Column      |Type      |Options                     |
|------------|----------|----------------------------|
|user        |references|null:false,foreign_key: true|
|product     |references|null:false                  |

### Association
belongs_to :user
belongs_to :product


### Association
belongs_to :user

## addressesテーブル
|Column         |Type      |Options                     |
|---------------|----------|----------------------------|
|post_code      |string    |null:false                  |
|prefecture     |string    |null:false                  |
|city           |string    |null:false                  |
|address        |string    |null:false                  |
|building_name  |string    |　　　　　　                  |
|phone_number   |string    |null:false                  |
|user           |references|null:false                  |

### Association
belongs_to :purchase

## Productsテーブル
|Column             |Type      |Options                     |
|-------------------|----------|----------------------------|
|name               |string    |null:false                  |
|description        |text      |null:false                  |
|price              |integer   |null:false                  |
|user               |references|null:false                  |
