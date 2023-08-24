class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item
  before_action :contributor_confirmation
  before_action :sale_confirmation
  before_action :index_definition


  def index
  end


  def create
    @order_form = OrderForm.new(order_params)
    if @order_form.valid?
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,  
        card: order_params[:token],    
        currency: 'jpy'                
      )
      @order_form.save
      redirect_to root_path
    else
      render :index#, status: :unprocessable_entity 
    end
  end

  private

  def set_item
    @item = Item.find(params[:item_id])
  end

  def contributor_confirmation
    redirect_to root_path if current_user.id == @item.user_id
  end

  def sale_confirmation
    redirect_to root_path if current_user.id != @item.user_id && Order.exists?(item_id: @item.id)
  end

  def index_definition
    gon.public_key = ENV["PAYJP_PUBLIC_KEY"]
    @order_form = OrderForm.new
  end


  def order_params
    params.require(:order_form).permit(:post_code, :prefecture_id, :city, :address, :building, :phone_num).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end
end
