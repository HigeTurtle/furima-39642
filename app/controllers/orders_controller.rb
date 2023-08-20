class OrdersController < ApplicationController
  before_action :authenticate_user!


  def index
  end

  def new
    @buy_form = BuyForm.new
  end

  def create
    @buy_form = BuyForm.new(order_params)
    if @buy_form.valid?
      @buy_form.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def order_params
    params.require(:buy_form).permit(:post_code, :prefecture_id, :city, :address, :building, :phone_num).merge(user_id: current_user.id)
  end
end
