class OrderShipment
  
  include ActiveModel::Model
  attr_accessor :token, :user_id, :item_id, :post_code, :prefecture_id, :city_town, :address, :building_name, :phone_number, :order_id

  with_options presence: true do
    validates :city_town
    validates :address

    VALID_POST_CODE = /\A[0-9]{3}-[0-9]{4}\z/
    VALID_PHONE_NUMBER = /[0-9]\d/

    validates :post_code, format: {with: VALID_POST_CODE, message: "Input correctly"}
    validates :phone_number, format: {with: VALID_PHONE_NUMBER, message:"Input only number" }

    validates :prefecture_id, numericality: { other_than: 1, message: "Select" }
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Shipment.create(post_code: post_code, prefecture_id: prefecture_id, city_town: city_town, address: address, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end
