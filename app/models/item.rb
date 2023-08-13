class Item < ApplicationRecord
  has_one_attached :image
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category, :condition, :delivery_charge, :prefecture, :delivery_schedule
end
