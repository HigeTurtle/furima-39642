class ItemsController < ApplicationController
  before_action :authenticate_user!,       except: [:index, :show]
  before_action :set_item,                 except: [:index, :create]
  before_action :contributor_confirmation, only:   [:destroy, :edit, :update]
  

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
     @item.destroy
     redirect_to root_path
  end


  def edit
  end


  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit, status: :unprocessable_entity
    end
  end


  private
  def item_params
    params.require(:item).permit(:name, :image, :explanation, :category_id, :condition_id, :charge_id, :prefecture_id, :schedule_id, :price) .merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id]) 
  end

  def contributor_confirmation
    redirect_to root_path unless current_user.id == @item.user_id
  end

end
