class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new ,:create]

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
      if @item.save
        redirect_to root_path
      else
        render :new, status: :unprocessable_entity
      end
  end

  def index
    @items = Item.all.order("created_at DESC")
  end


  private
  def item_params
    params.require(:item).permit(:name, :image, :explanation, :category_id, :condition_id, :charge_id, :prefecture_id, :schedule_id, :price) .merge(user_id: current_user.id)
  end
end
