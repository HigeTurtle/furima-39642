# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

#　userテーブル

|Column             |Type   |Options     |
|nickname           |string |null: false |
|email              |string |null: false |
|password           |string |null: false |
|encrypted_password |string |null: false |
|first_name         |string |null: false |
|last_name          |string |null: false |
|first_name_kana    |string |null: false |
|last_name_kana     |string |null: false |
|birthday           |date   |null: false |

has_many :items dependent: :destroy
has_many :order dependent: :destroy


#　itemテーブル

|Column            |Type       |Options                        |
|image             |string     |null: false                    |
|name              |string     |null: false                    |
|explanation       |text       |null: false                    |
|category          |string     |null: false                    |
|condition         |string     |null: false                    |
|delivery_charge   |string     |null: false                    |
|delivery_area     |string     |null: false                    |
|delivery_schedule |string     |null: false                    |
|price             |string     |null: false                    |
|user_id           |references |null: false, foreign_key: true |

belongs_to :user
has_one :order


#　addressテーブル

|Column     |Type       |Options                        |
|post_code  |string     |null: false                    |
|prefecture |string     |null: false                    |
|city       |string     |null: false                    |
|address    |string     |null: false                    |
|building   |string     |                               |
|phone_num  |string     |null: false                    |
|user_id    |references |null: false, foreign_key: true |

belongs_to :order


#　orderテーブル

|Column   |Type       |Options                        |
|item     |references |null: false, foreign_key: true |
|user     |references |null: false, foreign_key: true |

has_one :address
belongs_to :user
belongs_to :item
