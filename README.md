# **Simple Cooking**
**簡単に作れる料理を投稿、閲覧するアプリケーションです。**

**便利な冷凍食品を使った料理、レンジで調理できる料理など ”簡単・時短・便利” な料理。**
- 料理の投稿
- 投稿された料理の閲覧
- キーワードで料理を検索
- ユーザー登録

## Link
⇨ https://todays-dinner.herokuapp.com/

#### Test user
> user name: test
>
> email: test@test.com
>
> password: 1111111

## Background
私は料理をすることが好きではありません。

**料理にできるだけ時間をかけたくない。**

便利な**冷凍食品**をどんどん使いたい。

手間をかけるより**レンジ調理**が良い。

そんな思いを持っている人は私だけではない、絶対にたくさんいるはず。

そのような思いから、この[Simple Cooking](https://todays-dinner.herokuapp.com/)を開発しました。

## Demo
![ezgif com-video-to-gif](https://user-images.githubusercontent.com/67847966/95280497-183e9700-0890-11eb-9762-7523bdb2e032.gif)

## Environment
- Ruby 2.6.5
- heroku
- mySQL 14
- AWS EC2


## menusテーブル

|Colimn|Type|Options|
|------|----|-------|
|point|string|null: false|
|content|text||
|image|string|null: false|
|images|string||
|cookingTime_id|references|foreign_key: true|
|user_id|references|foreign_key: true|


### Association
- belongs_to :user
- belongs_to :cookingTime
- has_many :menu_keywords
- has_many :keywords, through: :menu_keywords


## usersテーブル

|Colimn|Type|Options|
|------|----|-------|
|name|string|null: false|
|email|string|null: false|
|password|string|null: false|
|password_confirmation|string|null: false|


### Asociation
- has_many :menus


## cooking_timesテーブル

|Colimn|Type|Options|
|------|----|-------|
|time|string||


### Asociation
- has_many :menus


## keywordsテーブル

|Colimn|Type|Options|
|------|----|-------|
|word|string||


### Asociation
- has_many :menu_keywords
- has_many :menus, through: :menu_keywords


## menu_keywordsテーブル

|Colimn|Type|Options|
|------|----|-------|
|menu_id|references|foreign_key: true|
|keyword_id|references|foreign_key: true|


### Asociation
- belongs_to :menu
- belongs_to :keyword
