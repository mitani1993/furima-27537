# 概要
テックキャンプ最終課題フリーマケットアプリ
![04485b2460dcb8e25b053cd64e1af18f](https://user-images.githubusercontent.com/69582233/110310463-ed768b80-8045-11eb-91d0-60000427f9b1.gif)

# URL
https://furima-27537.herokuapp.com/

#### Basic認証 ID/Pass
- ID: admin
- Pass: 2222

#### ログイン情報（テスト用
購入者用
- Eメール: test@example.com
- password: aaaa1111
<br>
購入用カード情報

- 番号：4242424242424242
- 期限：Fri Dec 24 2021 00:00:00 GMT+0900 (日本標準時)
- セキュリティコード：123
<br>
出品者用

- Eメール: hoge@hoge.com
- password: aaaa1111
<br>

# 動作確認方法
- WebブラウザGoogle Chromeの最新版を利用してアクセスしてください。
(ただしデプロイ等で接続できないタイミングもございます。その際は少し時間をおいてから接続してください。)

- 接続先およびログイン情報については、上記の通りです。
- 同時に複数の方がログインしている場合に、ログインできない可能性があります。
- テストアカウントでログイン→トップページから出品ボタン押下→商品情報入力→商品出品
- 確認後、ログアウト処理をお願いします。

## 機能一覧
- ユーザー管理機能
- 商品出品機能
- 商品一覧表示機能
- 商品詳細表示機能
- 商品情報編集機能
- 商品削除機能
- 商品購入機能

## 最終課題を経ての気づき
### 工夫した点
作業工程を分割して細かくリリースしたことです。
<br>
すべてまとめて実装してしまうとエラーがあった場合、どの時点のどの場所でエラーが発生したか把握するのに時間がかかってしまうため、「機能実装、テスト、デプロイ」を1つのタスクとしました。
<br>
1つの機能ごとに本番環境での動作確認ができたので、大きなエラーで作業が滞ることなくスムーズに開発が進みました。
<br>
### 苦労した点
商品登録ページと商品編集ページの手数料表示の部分が一番苦労しました。
<br>
非同期通信を利用しているためRuby on RailsとJavaScriptとのデータの受け渡しがうまくいかずエラーに悩まされました。
<br>
binding.pryとdebuggerを利用し、どこで処理が滞っているのか、受け渡されたデータの中身がどうなっているのか、などデータの流れを1から検証し実装することができました。
非常に苦労しましたが、デバッグツールの必要性を再認識し大変勉強になりました。

# 使用技術
### フロントエンド
- HTML
- CSS
- Javascript

### バックエンド
- Ruby2.6.5
- Ruby on Rails 6.0.3.4

### データベース
- MySQL2

### テスト
- RSpec
- FactoryBot
- Faker

### 本番環境
- Heroku
- AWS(S3)

### ソース管理
- GitHub, GitHubDesktop
<br>

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
| category_id      | integer   | foreign_key: true
| condition_id     | integer   | foreign_key: true
| shipping_fee_id  | integer   | foreign_key: true
| shipping_area_id | integer   | foreign_key: true
| shipping_date_id | integer   | foreign_key: true
| user             | reference | foreign_key: true

### Association
- belongs_to :user
- has_one :order

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
| phone_number  | string    | null: false
| order         | reference | foreign_key: true

### Association
- belongs_to :order

# ER図
![er](https://user-images.githubusercontent.com/69582233/110313996-9f17bb80-804a-11eb-97e1-619c0f7ab571.png)

