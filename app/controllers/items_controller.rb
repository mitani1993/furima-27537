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

  # def edit
  # end

  # def show
  # end

  # def update
  # end

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
