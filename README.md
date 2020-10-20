# furima DB設計

## usersテーブル
|culum|type|options|
|-----|----|-------|
|nickname|string|null: false|
|password|string|null: fals|
|email|string|null: false, unique: true,index:true|

### Association
- has_many :comments, dependent: :destroy
- has_many :favorites, dependent: :destroy
- has_many :todo_lists
- has_many :user_evaluations
- has_many :seller_items, foreign_key: "seller_id", class_name: "items"
- has_many :buyer_items, foreign_key: "buyer_id", class_name: "items"
- has_one :point
- has_one :profile, dependent: :destroy
- has_one :sns_authentication, dependent: :destroy
- has_one :sending_destination, dependent: :destroy
- has_one :credit_card, dependent: :destroy

## profilesテーブル
|culum|type|options|
|-----|----|-------|
|first_name|string|null :false|
|family_name|string|null :false|
|first_name_kana|string|null :false|
|family_name_kana|string|null :false|
|birth_year|integer|null :false|
|birth_month|integer|null :false|
|birth_day|integer|null :false|
|user_id|refences|null :false, foregin_key :true|

### Association

- belongs_to :user

## sns_authenticationsテーブル
|culumn|type|options|
|------|----|-------|
|provider|string|null: false|
|uid|string|null: false, unipue: true|
|token|text||
|user|references|null: false, foreign_key: true|

#### Association

- belongs_to :user


## destinationsテーブル
|culum|type|options|
|-----|----|-------|
|first_name|string|null :false|
|family_name|string|null :false|
|first_name_kana|string|null :false|
|family_name_kana|string|null :false|
|post_code|integer(7)|null :false|
|prefecture_code|integer|null :false, default :0|
|city|string|null :false|
|house_number|string|null :false|
|building_name|string||
|phone_number|integer|unique :true|
|user|references|null :false, foreign_key :true|

### Association

- belongs_to :user

## credit_cardsテーブル
|culum|type|options|
|-----|----|-------|
|card_number|integer|null :false, unique :true|
|expiration_year|integer|null :false|
|expiration_month|integer|null :false|
|security_code|integer|null :false|
|user|references|null :false, foreign_key :true|

#### Association

- belongs_to :user

## todo_listsテーブル
|culum|type|options|
|-----|----|-------|
|list|text|null: false|
|user|refences|null :false, foreign_key: true|

### Association

- belongs_to :user

## pointsテーブル
|culum|type|options|
|-----|----|-------|
|point|integer||
|user|refences|null: false, foreign_key: true|

### Association
- belongs_to :user

## user_evaluationsテーブル
|culum|type|options|
|-----|----|-------|
|review|text|null: false|
|user|references|null: false, foreign_key: true|
|item|references|null: false, foreign_key: true|
|evaluation|references|null: false, foreign_key: true|

### Association

- belongs_to_active_hash :evaluation
- belongs_to :user
- belongs_to :item

## itemsテーブル
|culum|type|options|
|-----|----|-------|
|name|string|null :false|
|introduction|text|null :false|
|price|integer|null :false|
|brand|references|foreign_key: true|
|item_condition|references|null: false,foreign_key: true|
|postage_payer|references|null: false,foreign_key: true|
|prefecture_code|integer|null :false|
|size|references|null: false, foreign_key: true|
|preparation_day|integer|null: false, foreign_key: true|
|postage_type|integer|null: false, foreign_key: true|
|item_img|integer|null: false, foreign_key: true|
|category|references|null :false, foreign_key :true|
|trading_status|enum|null: false|
|seller|references|null: false, foreign_key: true|
|buyer|references|foreign_key: true|
|deal_closed_date|timestamp||

### Association

- has_many :comments, dependent: :destroy
- has_many :favorites
- has_many :item_imgs, dependent: :destroy
- has_one :user_evaluation
- belongs_to :category
- belongs_to_active_hash :size
- belongs_to_active_hash :item_condition
- belongs_to_active_hash :postage_payer
- belongs_to_active_hash :preparation_day
- belongs_to_active_hash :postage_type
- belongs_to :brand
- belongs_to :seller, class_name: "User"
- belongs_to :buyer, class_name: "User"


## Photosテーブル
|culum|type|options|
|-----|----|-------|
|photo|string|null :false|
|item_id|refereces|null : false, foreign_key :true|
|draft_id|references|null :false, foreign_key: true|

### Association

- belongs_to :item
- belongs_to :draft


## brandsテーブル
|culum|type|options|
|-----|----|-------|
|name|string||

#### Association

- has_many :items

## item_imgsテーブル
|culum|type|options|
|-----|----|-------|
|url|string|null: false|
|item|references|null: false, foreign_key: true|

### Association

- belongs_to :item

## favoritesテーブル
|culum|type|options|
|-----|----|-------|
|user|references|null: false, foreign_key: true|
|item|references|null: false, foreign_key: true|

### Association

- belongs_to :user
- belongs_to :item

## commentsテーブル
|culum|type|options|
|-----|----|-------|
|comments|text|null: false|
|user|references|null: false, foreign_key: true|
|item|references|null: false, foreign_key: true|
|created_at|timestamp|null: false|

### Associations

- belongs_to :user
- belongs_to :item

## categoriesテーブル
|culum|type|options|
|-----|----|-------|
|name|string|null: false|
|ancestry|string|null: false|

### Association

- has_many :items
