class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit]
  before_action :set_item, only: [:update, :edit]
  
  def index
    @items = Item.order('created_at DESC')
  end

  def new
    @items = Item.new
  end

  def show
    @items = Item.find(params[:id])
  end

  def edit
    if current_user.id != @item.user_id
      redirect_to root_path
    end
  end

  def update
    
    @item.update(item_params)
    if @item.valid?
      @item.save
      redirect_to root_path
    else
      render :edit
    end
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
    params.require(:item).permit(:name, :image, :price, :status_id, :shopping_cost_id, :shopping_day_id, :prefecture_id, :category_id, :description).merge(user_id: current_user.id)
  end
  
  def  set_item
    @item = Item.find(params[:id])
  end
end