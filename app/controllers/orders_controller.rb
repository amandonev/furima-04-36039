class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @pay_delivery = PayDelivery.new
  end

  def new
    @pay_delivery = PayDelivery.new
  end

  def create
    @item = Item.find(params[:item_id])
    @pay_delivery = PayDelivery.new(order_params)
    if @pay_delivery.valid?
      pay_item
      @pay_delivery.save
      redirect_to root_path
    else
      render :index
    end
  end


  private
  def order_params
    params.require(:pay_delivery).permit(:postal_code, :prefecture_id, :city, :address,
                                         :building, :phone_number).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = "sk_test_f02dbd9720ec5f8045f8d245"  # テスト秘密鍵
      Payjp::Charge.create(
        amount: @item.price,  
               #  仮説検証  @item.price
        card: order_params[:token],    
        currency: 'jpy'                 
      )
  end


end

