# README

## usersテーブル

|Column            |Type   |Options                 |
|------------------|-------|------------------------|
|name              |string |null: false            |
|email             |string |null: false,unique: true|
|encrypted_password|string |null: false            |
|first_name        |string |null: false            |
|last_name         |string |null: false            |
|first_name_kana   |string |null: false            |
|last_name_kana    |string |null: false            |
|birthday          |date   |null: false            |


### Association
has_many　:products dependent: :destroy
has_many :purchases

## purchasesテーブル

|Column      |Type      |Options                     |
|------------|----------|----------------------------|
|user        |references|null:false,foreign_key: true|
|product     |references|null:false,foreign_key: true|

### Association
belongs_to :user
belongs_to :product
has_one :address

## addressesテーブル
|Column         |Type      |Options                     |
|---------------|----------|----------------------------|
|post_code      |string    |null:false                  |
|prefecture_id  |integer   |null:false                  |
|city           |string    |null:false                  |
|address        |string    |null:false                  |
|building_name  |string    |　　　　　　                  |
|phone_number   |string    |null:false                  |
|purchase       |references|null:false                  |

### Association
belongs_to :purchase

## Productsテーブル
|Column             |Type      |Options                     |
|-------------------|----------|----------------------------|
|name               |string    |null:false                  |
|description        |text      |null:false                  |
|price              |integer   |null:false                  |
|user               |references|null:false                  |
|category_id        |integer   |null:false                  |
|condition_id       |integer   |null:false                  |
|shipping_charge_id |integer   |null:false                  |
|prefecture_id      |integer   |null:false                  |
|shipping_day_id    |integer   |null:false                  |

### Association
belongs_to :user
has_one :purchase