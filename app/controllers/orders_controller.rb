class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :move_to_index

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

  def move_to_index #出品者がアクセスしたときトップページに飛ばされる
    item = Item.find(params[:item_id])
    redirect_to root_path unless current_user.id != item.user_id
  end
end
