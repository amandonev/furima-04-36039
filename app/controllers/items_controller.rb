class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit]
  before_action :set_item_find, only: [:edit, :update]

  def index
    @item = Item.all.order(id: 'DESC')
  end

  def new
    @item = Item.new
  end

  # def show
  # end

  def edit
    if current_user.id == @item.user_id
    else
      redirect_to root_path
    end
  end

  def update
    if @item.update(item_params)
      redirect_to item_path(@item.id), method: :get
    else
      render :edit
    end
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :image, :info, :category_id, :sales_status_id, :shipping_fee_status_id, :prefecture_id,
                                 :scheduled_id, :price).merge(user_id: current_user.id)
  end

  def set_item_find
    @item = Item.find(params[:id])
  end
end
