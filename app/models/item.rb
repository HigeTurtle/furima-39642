class Item < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  has_one :order
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :condition
  belongs_to :charge
  belongs_to :prefecture
  belongs_to :schedule
  
  validates :name, presence: true
  validates :explanation, presence: true
  validates :category_id, numericality: { other_than: 1  , message: "を選択してください"} 
  validates :condition_id, numericality: { other_than: 1  , message: "を選択してください"} 
  validates :charge_id, numericality: { other_than: 1  , message: "を選択してください"} 
  validates :prefecture_id, numericality: { other_than: 1  , message: "を選択してください"} 
  validates :schedule_id, numericality: { other_than: 1  , message: "を選択してください"} 
  validates :price, presence: true, numericality: {only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999}
  validates :image, presence: true
  
end
