class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
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
    @item = Item.find(params[:id])
  end

  def show
    @item = Item.find(params[:id])
  end

  def update
    item = Item.find(params[:id])
    if item.update(item_params)
      redirect_to action: :show
    else
      render :edit
    end
  end

  # def destroy
  # end

  private

  def item_params
    params.require(:item).permit(:name, :content,
                                 :price, :category_id,
                                 :condition_id, :shipping_fee_id,
                                 :shipping_area_id, :shipping_date_id,
                                 :image).merge(user_id: current_user.id)
  end
end
