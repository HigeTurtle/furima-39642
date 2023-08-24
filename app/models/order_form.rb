  class OrderForm
    include ActiveModel::Model
    attr_accessor  :user_id, :item_id, :post_code, :prefecture_id, :city, :address, :building, :phone_num, :token
  
    validate  :building

    with_options presence: true do
      validates :user_id  
      validates :item_id

      validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/} 
      validates :prefecture_id, numericality: { other_than: 1  , message: "can't be blank"} 
      validates :city
      validates :address
      validates :phone_num, format: { with: /\A\d{10}$|^\d{11}\z/ }
      
      validates :token
    end



    def save
      @order = Order.create(user_id: @user_id, item_id: @item_id)
      Address.create(post_code: post_code, prefecture_id: prefecture_id, city: city, address: address, building: building, phone_num: phone_num, order_id: @order.id)
    end
  end
