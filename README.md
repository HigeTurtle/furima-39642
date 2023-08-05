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

#　usersテーブル

|Column             |Type   |Options                   |
|-------------------|-------|--------------------------|
|nickname           |string |null: false               |
|email              |string |null: false, unique: true |
|encrypted_password |string |null: false               |
|first_name         |string |null: false               |
|last_name          |string |null: false               |
|first_name_kana    |string |null: false               |
|last_name_kana     |string |null: false               |
|birthday           |date   |null: false               |

has_many :items 
has_many :orders 


#　itemsテーブル

|Column                |Type       |Options                        |
|----------------------|-----------|-------------------------------|
|name                  |string     |null: false                    |
|explanation           |text       |null: false                    |
|category_id           |integer    |null: false, foreign_key: true |
|condition_id          |integer    |null: false, foreign_key: true |
|delivery_charge_id    |integer    |null: false, foreign_key: true |
|prefecture_id         |integer    |null: false, foreign_key: true |
|delivery_schedule_id  |integer    |null: false, foreign_key: true |
|price                 |integer    |null: false                    |
|user                  |references |null: false, foreign_key: true |

belongs_to :user
has_one :order
belongs_to :category
belongs_to :condition
belongs_to :delivery_charge
belongs_to :prefecture
belongs_to :delivery_schedule


  # categoriesテーブル

  |Column                |Type       |Options                        |
  |----------------------|-----------|-------------------------------|
  |category              |string     |null: false                    |
  
  has_many :items dependent: :destroy


  # conditionsテーブル

  |Column                |Type       |Options                        |
  |----------------------|-----------|-------------------------------|
  |condition             |string     |null: false                    |
  
  has_many :items 


  # delivery_chargeテーブル

  |Column                |Type       |Options                        |
  |----------------------|-----------|-------------------------------|
  |delivery_charge       |string     |null: false                    |
  
  has_many :items 


  # prefecturesテーブル

  |Column                |Type       |Options                        |
  |----------------------|-----------|-------------------------------|
  |prefecture            |string     |null: false                    |
  
  has_many :items dependent: :destroy
  has_many :addresses dependent: :destroy



  # delivery_scheduleテーブル

  |Column                |Type       |Options                        |
  |----------------------|-----------|-------------------------------|
  |delivery_schedule     |string     |null: false                    |
  
  has_many :items dependent: :destroy




#　addressesテーブル

|Column           |Type       |Options                        |
|-----------------|-----------|-------------------------------|
|post_code        |string     |null: false                    |
|prefecture_id    |integer    |null: false                    |
|city             |string     |null: false                    |
|address          |string     |null: false                    |
|building         |string     |                               |
|phone_num        |string     |null: false                    |
|order            |references |null: false, foreign_key: true |

belongs_to :order
belongs_to :prefecture



#　ordersテーブル

|Column   |Type       |Options                        |
|---------|-----------|-------------------------------|
|item     |references |null: false, foreign_key: true |
|user     |references |null: false, foreign_key: true |

has_one :address
belongs_to :user
belongs_to :item
