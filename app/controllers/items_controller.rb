class ItemsController < ApplicationController


  private
  def message_params
    params.require(:item).permit(:image).merge(user_id: current_user.id)
  end
end
