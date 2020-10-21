class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @order_shipment = OrderShipment.new
  end

  def new
    @order_shipment = OrderShipment.new
  end

  def create
    #binding.pry
    @item = Item.find(params[:item_id])
    @order_shipment = OrderShipment.new(order_params)
    if @order_shipment.valid?
      pay_item
      @order_shipment.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private
  def order_params
    params.require(:order_shipment).permit(:post_code, :prefecture_id, :city_town, :address, :building_name, :phone_number).merge(user_id: current_user.id, token: params[:token], item_id: params[:item_id])
  end

  def pay_item
    Payjp.api_key = "sk_test_bb38f4c558d34a2f5c5a6291" 
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end
