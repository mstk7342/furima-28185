class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  
  def index
    @items = Item.all
  end

  def new
    @items = Item.new
  end

  def show
  end

  def create
    @items = Item.new(item_params)
    if @items.valid?
      @items.save
      redirect_to root_path
    else
      render :new
    end
  end

  def item_params
    params.require(:item).permit(:name, :image, :price, :status_id, :shopping_cost_id, :shopping_days_id, :prefectures_id, :category_id, :description).merge(user_id: current_user.id)
  end
end
