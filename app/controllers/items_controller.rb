class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  def index
    @items = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def show
    @item = Item.find(params[:id])
    @category = Category.find(params[:id])
    @status = Status.find(params[:id])
    @delivery_charge = DeliveryCharge.find(params[:id])
    @delivery_area = DeliveryArea.find(params[:id])
    @day_to_delivery = DayToDelivery.find(params[:id])
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:image, :name, :text, :category_id, :status_id, :delivery_charge_id, :delivery_area_id, :day_to_delivery_id, :price).merge(user_id: current_user.id)
  end
end
