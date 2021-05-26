class BuysController < ApplicationController

  def index
  end
  
  def new
    @item = Item.find(params[:item_id])
    @buy_form = BuyForm.new
  end

  def create
    @item = Item.find(params[:item_id])
    @buy_form = BuyForm.new(buy_params)
    if @buy_form.valid?
      pay_item
      @buy_form.save
      redirect_to root_path(@buy_form)
    else
      render :new
    end
  end


  private

  def buy_params
    params.require(:buy_form).permit(:postal_code, :shipping_area_id, :city, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: buy_params[:token],
      currency: 'jpy'
    )
  end

end

