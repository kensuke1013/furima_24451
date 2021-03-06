class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :edit, :create, :update, :destroy]
  before_action :set_item, only: [:edit, :update, :show, :destroy]
  before_action :check_item, only: [:edit]


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


  def update
    if @item.update(post_params)
      redirect_to root_path
    else
      render :edit
    end
  end

  def destroy
    if @item.user_id == current_user.id
      @item.destroy
      redirect_to root_path
    end
  end

  private

  def post_params
    params.require(:item).permit(:content, :item_img, :name, :introduction, :genre_id, :itemstatus_id, :deliveryfee_id, :shipmentsource_id, :daystoship_id, :item_price_id)
    .merge(user_id: current_user.id)
  end

  def check_item
    if @item.user_id != current_user.id
      redirect_to action: :index
    end
  end
 
  def set_item
    @item = Item.find(params[:id])
  end
end
