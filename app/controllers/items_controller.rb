class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :move_to_index, only: [:edit, :destroy, :update]
  before_action :set_item, only: [:edit, :show, :update, :destroy]
  before_action :purchased_item_move_to_index, only: [:edit, :destroy, :update]

  def index
    @items = Item.includes(:user).order(id: 'DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to action: :index
    else
      render :new
    end
  end

  def edit
  end

  def show
  end

  def update
    if @item.update(item_params)
      redirect_to action: :show
    else
      render :edit
    end
  end

  def destroy
    @item.destroy
    redirect_to action: :index
  end

  private

  def item_params
    params.require(:item).permit(:name, :content,
                                 :price, :category_id,
                                 :condition_id, :shipping_fee_id,
                                 :shipping_area_id, :shipping_date_id,
                                 :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end

  # 出品者以外がアクセスしたときindexに飛ばされる
  def move_to_index
    set_item
    redirect_to root_path unless current_user.id == @item.user_id
  end

  def purchased_item_move_to_index
    set_item
    redirect_to root_path unless @item.order.blank?
  end
end
