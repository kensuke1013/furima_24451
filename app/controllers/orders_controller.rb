class OrdersController < ApplicationController

  def index
    @user_order = FormObject.new
    @item = Item.find(params[:item_id])
  end

  def new
  end


  def create
    @item = Item.find(params[:item_id])
    @user_order = FormObject.new(order_params)
    if @user_order.valid?
      pay_item
      @user_order.save
      return redirect_to root_path
    else
      render 'index'
    end
  end

  private

  def order_params
    params.require(:form_object).permit(:post_code, :shipmentsource_id, :city, :house_number, :building_name, :phone_number).merge(item_id: params[:item_id],user_id: current_user.id,token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @item.item_price_id,  # 商品の値段
      card: order_params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end

end
