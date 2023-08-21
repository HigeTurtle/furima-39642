  class OrderForm
    include ActiveModel::Model
    attr_accessor :post_code, :prefecture_id, :city, :address, :building, :phone_num, :user, :item 
  
    validates :user    , presence: true
    validates :item    , presence: true
  
    validates :post_code    , presence: true, format: /\A\d{3}[-]?\d{4}\z/ , format: /\A[0-9]+\z/
    validates :prefecture_id, numericality: { other_than: 1  , message: "can't be blank"} 
    validates :city         , presence: true
    validates :address      , presence: true
    validate  :building
    validates :phone_num    , presence: true, format: /\A\d{10,11}\z/ , format: /\A[0-9]+\z/
    validates :order, presence: true
  
  
    def save
      @order = Order.create(user_id: @user.id, item_id: @item.id)
      Address.create(post_code: post_code, prefecture_id: prefecture_id, city: city, address: address, building: building, phone_num: phone_num, order_id: @order.id)
    end
  end
