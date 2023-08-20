  class OrderForm
    include ActiveModel::Model
    attr_accessor :post_code, :prefecture_id, :city, :address, :building, :phone_num, :user, :item 
  
    validates :user    , presence: true
    validates :item    , presence: true
  
    validates :post_code    , presence: true
    validates :prefecture_id, numericality: { other_than: 1  , message: "can't be blank"} 
    validates :city         , presence: true
    validates :address      , presence: true
    validates :building
    validates :phone_num    , presence: true
    validates :order, presence: true
  
  
    def save
      @user = User.find(params[:id]) 
      @item = Item.find(params[:id]) 
      @order = Order.create(user_id: @user.id, item_id: @item.id)
      Address.create(post_code: post_code, prefecture_id: prefecture_id, city: city, address: address, building: building, phone_num: phone_num, order_id: @order.id)
    end