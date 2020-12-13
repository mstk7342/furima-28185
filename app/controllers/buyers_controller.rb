class BuyersController < ApplicationController
  before_action :set_item, only: [:index, :create]
  before_action :authenticate_user!, only: [:index]

  def index
    @buyer = BuyerDestination.new
    if @item.buyer != nil || current_user.id == @item.user_id
      redirect_to root_path
    end
  end

  def create
    @buyer = BuyerDestination.new(buyer_params)
    if @buyer.valid?
      pay_item
      @buyer.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def buyer_params
    params.require(:buyer_destination).permit(:postal_code, :prefecture_id, :city, :addres, :building_name, :phone_number, :buyer_id).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end
  def  set_item
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.price,
      card: buyer_params[:token],
      currency:'jpy'
    )
  end
end
