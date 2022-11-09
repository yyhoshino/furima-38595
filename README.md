# README

## usersテーブル

|Column           |Type   |Options             |
|-----------------|-------|--------------------|
|name             |string |null: false,        |
|email            |string |null: false,        |
|password         |string |null: false,        |
|first_name       |string |null: false,        |
|last_name        |string |null: false,        |
|first_name_kana  |string |null: false,        |
|last_name_kana   |string |null: false,        |
|birthday         |integer|null: false,        |


### Association
has_many　:products dependent: :destroy
belongs_to :purchase
belongs_to :card dependent: :destroy

## purchaseテーブル

|Column         |Type   |Options                     |
|---------------|-------|----------------------------|
|user_id        |integer|null:false,foreign_key: true|
|produces_id    |integer|null:false                  |

### Association
belongs_to :user

## cardsテーブル
|Column         |Type   |Options                     |
|---------------|-------|----------------------------|
|user_id        |string |null:false,foreign_key: true|
|card_id        |string |null:false                  |

### Association
belongs_to :user

## addressesテーブル
|Column         |Type   |Options                     |
|---------------|-------|----------------------------|
|post_code      |string |null:false                  |
|prefecture     |string |null:false                  |
|city           |string |null:false                  |
|address        |string |null:false                  |
|building_name  |string |null:false                  |
|phone_number   |string |null:false                  |
|user_id        |integer|null:false                  |

### Association
belongs_to :user

## Productsテーブル
|Column             |Type   |Options                     |
|-------------------|-------|----------------------------|
|name               |string |null:false                  |
|description        |string |null:false                  |
|price              |string |null:false                  |
|category_id        |integer|null:false                  |
|condition_id       |integer|null*false                  |
|shipping_charge_id|integer|null:false                  |
|shipping_area_id   |integer|null:false                  |
|shipping_day_id    |integer|null:false                  |
|brand_id           |integer|null:false                  |

### Association
belongs_to :user dependent: :destroy
belongs_to :category dependent: :destroy
belongs_to :condition dependent: :destroy
belongs_to :shipping_charges dependent: :destroy
belongs_to :shipping_area dependent: :destroy
belongs_to :shipping_day dependent: :destroy
belongs_to :brand dependent: :destroy

## products_imagesテーブル
|Column             |Type   |Options                     |
|-------------------|-------|----------------------------|
|products_id        |integer|null:false,foreign_key: true|

### Association
belongs_to :product

## categoryテーブル
|Column             |Type   |Options                     |
|-------------------|-------|----------------------------|
|name               |string |null:false                  |

### Association
has_many :products

## conditionsテーブル
|Column             |Type   |Options                     |
|-------------------|-------|----------------------------|
|condition          |string |null:false                  |

### Association
has_many :products

## shipping_chargesテーブル
|Column             |Type   |Options                     |
|-------------------|-------|----------------------------|
|shipping_charge    |string |null:false                  |

### Association
has_many :products

## shipping_areasテーブル
|Column             |Type   |Options                     |
|-------------------|-------|----------------------------|
|shipping_area      |string |null:false                  |

### Association
has_many :products

## shipping_daysテーブル
|Column             |Type   |Options                     |
|-------------------|-------|----------------------------|
|shipping_day       |string |null:false                  |

### Association
has_many :products

## brandsテーブル
|Column             |Type   |Options                     |
|-------------------|-------|----------------------------|
|brand              |string |null:false                  |

### Association
has_many :products