# テーブル設計

## usersテーブル

| Column             | Type      | Options     
| ----------         | ------    | ----------- 
| nickname           | string    | null: false
| email              | string    | null: false, unique: true
| encrypted_password | string    | null: false
| family_name        | string    | null:false
| first_name         | string    | null:false
| family_name_kana   | string    | null:false
| first_name_kana    | string    | null:false
| birth              | date      | null:false

### Association
- has_many :items, dependent: :destroy
- has_many :orders
- has_one :address, dependent: :destroy

# itemsテーブル
| Column           | Type      | Options     
| ----------       | ------    | ----------- 
| name             | string    | null: false
| content          | text      | null: false
| price            | integer   | null: false
| image            |           |
| category_id      | integer   | foreign_key: true
| condition_id     | integer   | foreign_key: true
| shipping_fee_id  | integer   | foreign_key: true
| shipping_area_id | integer   | foreign_key: true
| shipping date_id | integer   | foreign_key: true
| user             | reference | foreign_key: true

### Association
- belongs_to :user
- has_many :orders

# ordersテーブル
| Column        | Type      | Options     
| -------       | ------    | ----------- 
| user          | reference | foreign_key: true
| item          | reference | foreign_key: true

### Association
- belongs_to :user
- belongs_to :item
- has_one :address


# addressesテーブル
| Column        | Type      | Options     
| -------       | ------    | ----------- 
| post_code     | string    | null: false
| prefecture_id | integer   | null: false
| city          | string    | null: false
| house_number  | string    | null: false
| building_name | string    | 
| order         | reference | foreign_key: true

### Association
- belongs_to :order


