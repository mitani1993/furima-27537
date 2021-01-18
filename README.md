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
| condition     | reference | 
| shipping_fee  | reference |
| shipping_area | reference |
| shipping date | reference |
| user          | reference |

### Association
- belongs_to :user
- belongs_to :category, dependent: :destroy


# categoriesテーブル
| Column        | Type      | Options     
| ----------    | ------    | ----------- 
| name

### Association
- has_many :items
