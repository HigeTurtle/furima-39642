class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new ,:create, :destroy]
  before_action :set_item,           only: [:show ,:destroy]

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

  def show
  end

  def destroy
    if current_user.id == @item.user_id
     @item.destroy
    end
    redirect_to root_path
  end



  private
  def item_params
    params.require(:item).permit(:name, :image, :explanation, :category_id, :condition_id, :charge_id, :prefecture_id, :schedule_id, :price) .merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id]) 
  end
end
