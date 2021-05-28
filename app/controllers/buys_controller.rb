class BuysController < ApplicationController
  before_action :authenticate_user!
  before_action :buy_user
  
  def new
    @buy_form = BuyForm.new
  end

  def create
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

  def buy_user
    @item = Item.find(params[:item_id])
    if @item.user_id == current_user.id
      redirect_to root_path
    elsif current_user && @item.buy.present?
      redirect_to root_path
    end
  end

end

