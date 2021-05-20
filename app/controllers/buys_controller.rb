class BuysController < ApplicationController

  def index
  end
  
  def new
    @item = Item.find(params[:item_id])
    @buy_form = BuyForm.new
  end

  def create
    @buy_form = BuyForm.new(buy_params)
    if @buy_form.valid?
      @buy_form.save
      redirect_to root_path
    else
      render :new
    end
  end


  private

  def buy_params
    params.require(:buy_form).permit(:postal_code, :shipping_area_id, :city, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id])
  end

end

