class OrdersController < ApplicationController
  def index
    @item = Item.find(params[:item_id])
    @order_shipment = OrderShipment.new
  end

  def new
    @order_shipment = OrderShipment.new
  end

  def create
    @order_shipment = OrderShipment.new(order_params)
    if @order_shipment.valid?
      @order_shipment.save
      redirect_to root_path
    else
      redirect_to item_orders_path
    end
  end

  private
  def order_params
    params.permit(:item_id, :post_code, :prefecture_id, :city_town, :address, :building_name, :phone_number, :order_id, :item_id).merge(user_id: current_user.id)
  end
end
