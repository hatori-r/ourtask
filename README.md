\
\
\
![our_task_readme_banner](https://user-images.githubusercontent.com/63530890/87664425-2f457f80-c7a0-11ea-99c4-7ac8ee2dc291.png)
# [our task](http://ourtask.tokyo/) 
<br>
<br>

# 📕 Name - our task (タスク管理・シェアアプリケーション)
![](https://img.shields.io/badge/ruby-2.5.1-red)
![](https://img.shields.io/badge/rails-5.2.4.3-red)
![](https://img.shields.io/badge/mysql-5.6.47-blue)
![](https://img.shields.io/badge/jQuery-1.12.4-blue)
![](https://img.shields.io/badge/AWS-EC2-orange)
![](https://img.shields.io/badge/AWS-S3-orange)

## 📍Introduction
our taskはタスクを他のユーザーにシェアできるアプリケーションです。  

投稿するタスクには目標達成までの期限を決めることが出来るので他のユーザーに共有して、  
達成する意識を高めることが出来ます。  

またタスクの進捗状況も設定できるので、進捗管理も行いやすくなっております。  

## 📍Demo

### トップページ
#### 未ログイン時
- 未ログイン時でも画面を下にスクロールしていただくと投稿一覧を見ることが出来ます。

<img width="1680" alt="toppage" src="https://user-images.githubusercontent.com/63530890/87650755-1f707000-c78d-11ea-8a02-b10379da0f95.png">

#### ログイン時
- ユーザーの投稿一覧を見ることが出来ます。

<img width="1680" alt="login-toppage" src="https://user-images.githubusercontent.com/63530890/87650809-357e3080-c78d-11ea-8f71-a3a85921457b.png">

### タスクの投稿
- 投稿の個別ページです。

<img width="1680" alt="post-task" src="https://user-images.githubusercontent.com/63530890/87651698-2f3c8400-c78e-11ea-904c-359cd7b0a347.png">

### タスクへのコメント
- 投稿の個別ページで投稿にコメントすることが出来ます。
<img width="1680" alt="a-comment" src="https://user-images.githubusercontent.com/63530890/87653932-3618c600-c791-11ea-88ce-c76924d7624b.png">

### タスクへのいいね
- 投稿の個別ページで投稿にいいねをすることが出来ます。

<img width="1680" alt="like-task" src="https://user-images.githubusercontent.com/63530890/87654095-68c2be80-c791-11ea-95c7-6ea9c96563b0.png">

### ユーザーフォロー
- 各ユーザーをフォローすることが出来ます。

<img width="1680" alt="follow" src="https://user-images.githubusercontent.com/63530890/87654405-cfe07300-c791-11ea-9497-229fd6f62503.png">

### サイトのアドレスです
#### http://ourtask.tokyo/

## 📍Usage
このアプリの機能一覧です
- ユーザー登録機能（登録にはmailアドレスが必要です。）
- 簡単ログイン機能（未ログイン時のトップページまたは、ログインページよりログインできます。）
- ユーザーログイン、ログアウト、編集機能
- タスク投稿機能
- タスク検索機能
- コメント機能
- いいね機能
- ユーザーフォロー機能
- レスポンシブ対応（画面幅が850px以下になると作動します）
- ハンバーガーメニュー機能（画面幅が850px以下になると作動します）

## 📍Install
https://github.com/hatori-r/our_task.git

## 📍Author
- Hattori Reiya(hatori-r)： [Twitter](https://twitter.com/hariy053)　[Facebook](https://www.facebook.com/hatorir12/)　[blog](https://hatoriblog.com)

# 📕 DB設計図

## users テーブル
|Column|Type|Options|
|------|----|-------|
|email|string|null: false|
|nickname|string|null: false|
|profile|string||
|site|string||
|twitter|string||
|facebook|string||
|instagram|string||
|image|text||
### Association
- has_many :tasks, dependent: :destroy
- has_many :comments, dependent: :destroy
- has_many :like, dependent: :destroy
- has_many :liked_tasks, through: :likes, source: :task
- has_many :relationships, dependent: :destroy
- has_many :followings, through: :relationships, source: :follow
- has_many :reverse_of_relationships, class_name: 'Relationship', foreign_key: 'follow_id'
- has_many : followers, through: :reverse_of_relationships, source: :user

## tasks テーブル
|Column|Type|Options|
|------|----|-------|
|task|string||
|state|integer||
|user_id|integer||
|limit_date|date||
### Association
- belongs_to :user
- has_many :comments, dependent: :destroy
- has_many :likes, dependent: :destroy
- has_many :liked_users, through: :likes, source: :user

## comments テーブル
|Column|Type|Options|
|------|----|-------|
|text|text||
|user_id|integer||
|task_id|integer||
### Association
- belongs_to :user
- belongs_to :task

## likes テーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|foreign_key: true|
|task_id|integer|foreign_key: true|
### Association
- belongs_to ;user
- belongs_to ;task

## relationships テーブル
|Column|Type|Options|
|------|----|-------|
|user|references|foreign_key: true|
|follow|references|foreign_key: { to_table: :users }|
### Association
- belongs_to :user
- belongs_to :follow, class_name: 'User'