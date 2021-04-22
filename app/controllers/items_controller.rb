class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path(@item)
    else
      render :new
    end
  end
  

  private

  def item_params
    params.require(:item).permit(:image, :title, :text, :goods_category_id, :goods_condition_id, :shipping_charges_id, :shipping_area_id, :shipping_days_id, :price).merge(user_id: current_user.id)
  end

end
