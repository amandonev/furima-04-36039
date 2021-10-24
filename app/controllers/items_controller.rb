class ItemsController < ApplicationController


  def index
  end

  private
  def item_params
    params.require(:item).permit(:name, :image, :info, :category_id, :sales_status_id, :shipping_fee_status_id,
                                 :prefecture_id, :scheduled_id, :price).merge(user_id: current_user.id)
  end


end
