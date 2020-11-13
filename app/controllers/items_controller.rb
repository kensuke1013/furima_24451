class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :update, :show]
  def index
    @items = Item.all
  end

  def new 
    @item = Item.new
  end

  def edit
  end

  def show
    
  end

  def create
    Item.create(post_params)
    redirect_to root_path
  end


  def update
    @items.update(post_params)
    redirect_to root_path
  end

  private

  def post_params
    params.require(:item).permit(:content, :item_img, :name, :introduction, :genre_id, :itemstatus_id, :deliveryfee_id, :shipmentsource_id, :daystoship_id, :item_price_id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
