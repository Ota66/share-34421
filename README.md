# テーブル設計

## users テーブル

| Column       | Type   | Options     |
| ------------ | ------ | ----------- |
| name         | string | null: false |
| email        | string | null: false |
| password     | string | null: false |
| introduction | text   |             |

### Association

- has_many :room_users
- has_many :rooms, through: room_users
- has_many :messages
- has_many :tweets
- has_many :comments

## tweets テーブル

| Column | Type       | Options     |
| ------ | ---------- | ----------- |
| user   | references | null: false |
| text   | text       |             |

### Association

- belongs_to :user
- has_many :comments

## comments テーブル

| Column  | Type       | Options     |
| ------- | ---------- | ----------- |
| user    | references | null: false |
| tweet   | references | null: false |
| comment | string    | null: false |

### Association

- belongs_to :user
- belongs_to :tweet

## rooms テーブル

| Column | Type       | Options     |
| ------ | ---------- | ----------- |
| user   | references | null: false |

### Association

- has_many :room_users
- has_many :users, through: room_users
- has_many :messages

## room_users テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| user   | references | null: false, foreign_key: true |
| room   | references | null: false, foreign_key: true |

### Association

- belongs_to :room
- belongs_to :user

## messages テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| message | string     |                                |
| user    | references | null: false, foreign_key: true |
| room    | references | null: false, foreign_key: true |

### Association

- belongs_to :room
- belongs_to :user