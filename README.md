# アプリケーション名
- Shares(シェアーズ)

# 概要
- 自分の出来事や伝えたいことを共有できるアプリです。
- テキスト、画像、動画を投稿することが出来ます。
- 投稿したツイートは編集したり、削除出来ます。
- 他ユーザーのツイートにコメントが出来ます。
- ツイートに対していいねが出来ます。また取り消すことも可能です。
- ユーザー編集ができ、トップ画像、ヘッター画像が設定できます。

# URL
- https://share-34421.herokuapp.com/

# テスト用アカウント
- Basic認証（ID/Pass)
  ID:mimimi  
  Pass:222222
- テスト用アカウント
  NickName:太郎  
  Email:mitu@yahoo.co.jp  
  Password:32104mi

# 利用方法
- 投稿方法  
①始めに左側にログインボタンが表示されているのでテスト用アカウントでサインインするか、 ご自分でお好きなアカウントをお作りして新規登録していただきます。  
②トップページ左側に投稿ボタンがあるので押します。  
③投稿入力画面が表示されるのでお好きな内容を入力し投稿ボタンを押します。  
④トップページに遷移し投稿内容が表示されます。(必要に応じて"編集","削除","いいね"ボタンを押しても構いません。 )
- ユーザー編集方法  
①ログインしている状態で左側にご登録していただいたユーザー名を押します。  
②ユーザー詳細ページに遷移し右側に変更ボタンがあるので押します。  
③ユーザー編集入力画面が表示されるのでお好きなトップ画像、ヘッター画像、自己紹介文を入力し完了ボタンを押します。  
④ユーザー詳細ページに遷移し変更内容が表示されます。
# 課題解決
- ターゲットは男女問わず10代〜40代です。  
- 
# 要件定義
| 機能     | 目的                                          | 要件 |
|:-------:|:---------------------------------------------:|:------------:|
| ユーザー管理機能 | ユーザー管理機能を追加し管理できるようにするため     | ・ユーザーアカウントの登録、ログイン、ログアウトが出来るようにする。 |
| 写真、動画テキスト投稿機能 | テキストと写真、動画が投稿できるようにするため       | ・ユーザー登録していれば投稿できるようにする。<br>・何度でも投稿できるようにする<br>・ツイートの削除編集が出来るようにする|
| ツイート検索 | ユーザーが簡単にデータ検索出来るようにするため      | ・ツイートが複数投稿されていることが前提にする。<br>・テキストの検索条件を指定する欄を儲けるようにする<br>・条件に該当するツイートの検索結果のページで表示するようにする  |
| コメント機能 | ツイートに関してコメントが行えるようにするため        | ・コメントは詳細画面に表示されるようにする<br>・ユーザー登録していれば誰にでもコメントが出来るようにする |
| いいね機能 | ユーザーがツイートに関していいねが出来るようにするため | ・いいねは一つのツイートに一人一回のみ出来るようにする<br>・複数のツイートにいいねが出来るようにする<br>・ログインしていないといいねは出来ないようにする<br>・いいねを取り消すことが出来るようにする |
| ユーザーのトップ画像、ヘッター画像 | ユーザーがトップ画像、ヘッター画像を設定できるようにするため    | ・新規登録後にユーザー編集でトップ画像、ヘッター画像の設定が出来るようにする |
| ダークモード | バッテリー消費を抑え目の疲れを軽減するため          | ・ライトモード/ダークモードをチェックボックスによって切り替えられるようにする |
| Basic認証 | 最低限のセキュリティ確保のため                   |  ・Basic認証の導入する<br>・環境変数で見えない形にする |
| デプロイ | 実際に第三者に使用してもらうため                  | ・環境変数で見えない形にする |


# 実装した機能（GIF説明)
- 動画、テキスト投稿  

- 投稿編集、削除  

- ユーザー編集  

- いいねユーザー一覧  

- ツイート検索  

# 工夫した点

# 今後の実装予定機能
- 個人チャット機能
- フォロー機能
- レスポンシブデザイン

# ER図/テーブル表


## users テーブル

| Column       | Type   | Options                   |
| ------------ | ------ | ------------------------- |
| name         | string | null: false               |
| email        | string | null: false, unique: true |
| password     | string | null: false               |
| introduction | text   |                           |
| avatar       | string |                           |
| header_image | string |                           |

### Association

- has_many :likes
- has_many :liked_users, through: :likes, source: :user
- has_many :tweets
- has_many :comments

## tweets テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| text   | text       | null: false                    |
| video  | string     |                                |

### Association

- belongs_to :user
- has_many :comments
- has_many :likes
- has_many :liked_users, through: :likes, source: :user

## comments テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| tweet   | references | null: false, foreign_key: true |
| text    | string     | null: false                    |

### Association

- belongs_to :user
- belongs_to :tweet

## likes テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| tweet  | references | null: false, foreign_key: true |

### Association

- belongs_to :tweet
- belongs_to :user
- validates_uniqueness_of :tweet_id, scope: :user_id

# ローカル動作方法

# 開発環境
Ruby 2.6.5  
Rails 6.0.3.3  
HTML/CSS  
MySQL 5.6.47/SequelPro 1.1.2  
GitHub  
Heroku  
Visual Studio Code 1.49.2  
