class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @user_order = UserOrder.new
  end

  def create
    @user_order = UserOrder.new(order_params)
  end

  private
  def order_params
    params.require(:user_order).permit(:hoge, :post_code, :prefecture_id, :city, :house_number, :building_name, :phone_number)
  end
end
