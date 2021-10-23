# README

# テーブル設計

## users テーブル
| Colum                 | Type    | Option                    |
| --------------------- | ------- | ------------------------- |
| email                 | string  | null: false, unique: true |
| encrypted_password    | string  | null: false               |
| nick_name             | string  | null: false               |
| first_name            | string  | null: false               |
| last_name             | string  | null: false               |
| first_name_kana       | string  | null: false               |
| last_name_kana        | string  | null: false               |
| birth_date            | date    | null: false               |

 ### Association
 - has_many :items
 - has_many :pays





## items テーブル
| Colum                   | Type       | Option                          |
| ----------------------- | ---------- | ------------------------------- |
| name                    | string     | null: false                     |
| info                    | text       | null: false                     |
| category_id             | integer    | null: false                     |
| sales_status_id         | integer    | null: false                     |
| shipping_fee_status_id  | integer    | null: false                     |
| prefecture_id           | integer    | null: false                     |
| scheduled_id            | integer    | null: false                     |
| price                   | integer    | null: false                     |
| user                    | references | null: false , foreign_key: true |

### Association
- belongs_to :user
- has_one :pay




## pays テーブル
| Colum                   | Type       | Option                          |
| ----------------------- | ---------- | ------------------------------- |
| user                    | references | null: false , foreign_key: true |
| item                    | references | null: false , foreign_key: true |

### Association
- belongs_to :user
- belongs_to :item
- has_one :delivery




## deliveries テーブル
| Colum                   | Type       | Option                          |
| ----------------------- | ---------- | ------------------------------- |
| postal_code             | string     | null: false                     |
| prefecture_id           | integer    | null: false                     |
| city                    | string     | null: false                     |
| address                 | string     | null: false                     |
| building                | string     |                                 |
| phone_number            | string     | null: false                     |
| pay                     | references | null: false , foreign_key: true |

## Association
- belongs_to :pay
