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
![ezgif com-video-to-gif (1)](https://user-images.githubusercontent.com/67847966/95280778-bfbbc980-0890-11eb-8033-284c9154a795.gif)

## Environment
- Ruby 2.6.5
- heroku
- mySQL 14
- AWS EC2

## 工夫したポイント
検索結果ページのフロント部分。投稿時にcollection_check_boxesで選択した項目を順番に表示させたり、料理のPointの説明が長い場合は、文頭から18文字だけ表示させるなどの工夫をしました。

## 課題・今後実装したい機能
投稿した料理に使用した食品や調理器具を、そのままAmazonなどで買えるような機能を実装したい。



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
