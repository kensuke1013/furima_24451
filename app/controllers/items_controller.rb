class ItemsController < ApplicationController
  before_action :set_item, only: [:edit, :update, :show]
  before_action :authenticate_user!, only: [:new, :edit, :create, :update]

  def index
    @items = Item.all.order("created_at DESC")
  end

  def new 
    @item = Item.new
  end

  def edit
  end

  def show
  end

  def create
    @item = Item.new(post_params)
    if @item.valid?
      @item.save
      redirect_to root_path
    else
      render :new  
    end
  end


  #def update
    #@items.update(post_params)
    #redirect_to root_path
  #end

  private

  def post_params
    params.require(:item).permit(:content, :item_img, :name, :introduction, :genre_id, :itemstatus_id, :deliveryfee_id, :shipmentsource_id, :daystoship_id, :item_price_id)
    .merge(user_id: current_user.id)
  end
 
  def set_item
    @item = Item.find(params[:id])
  end
end
