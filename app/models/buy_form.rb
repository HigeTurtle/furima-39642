class BuyForm
  include ActiveModel::Model
  attr_accessor :post_code, :prefecture_id, :city, :address, :building, :phone_num, :order 

  validates :post_code    , presence: true
  validates :prefecture_id, numericality: { other_than: 1  , message: "can't be blank"} 
  validates :city         , presence: true
  validates :address      , presence: true
  validates :building
  validates :phone_num    , presence: true

  belongs_to :order

  def save
    Address.create(post_code: post_code, prefecture_id: prefecture_id, city: city, address: address, building: building, phone_num: phone_num, user_id: user.id)
  end