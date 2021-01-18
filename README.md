# テーブル設計

## usersテーブル
| Column             | Type   | Options     
| ----------         | ------ | ----------- 
| nickname           | string | null: false
| email              | string | null: false, unique: true
| encrypted_password | string | null: false

### Association
- has_one :profile, dependent: :destroy
- has_many :items, dependent: :destroy

## profilesテーブル
| Column           | Type      | Options     
| ----------       | ------    | ----------- 
| family_name      | string    | null:false
| first_name       | string    | null:false
| family_name_kana | string    | null:false
| first_name_kana  | string    | null:false
| birth_year       | date      | null:false
| birth_month      | date      | null:false
| birth_day        | date      | null:false
| user             | reference | foreign_key: true

### Association
- belongs_to :user

# itemsテーブル
| Column        | Type      | Options     
| ----------    | ------    | ----------- 
| name          | string    | null: false
| content       | text      | null: false
| price         | integer   | null: false
| image         |           |
| category      | reference | foreign_key: true
| condition     | reference | foreign_key: true
| shipping_fee  | reference | foreign_key: true
| shipping_area | reference | foreign_key: true
| shipping date | reference | foreign_key: true
| user          | reference | foreign_key: true

### Association
- belongs_to :user
- belongs_to :category, dependent: :destroy
- belongs_to_active_hash :condition
- belongs_to_active_hash :shipping_fee
- belongs_to_active_hash :shipping_area
- belongs_to_active_hash :shipping date


# categoriesテーブル
| Column        | Type      | Options     
| ----------    | ------    | ----------- 
| name          | string    | null: false

### Association
- has_many :items
