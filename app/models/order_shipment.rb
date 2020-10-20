class OrderShipment
  
  include ActiveModel::Model
  attr_accessor :user_id, :item_id, :post_code, :prefecture_id, :city_town, :address, :building_name, :phone_number, :order_id

  with_options presence: true do
    validates :city_town
    validates :address

    VALID_POST_CODE = /\A\d{3}[-]\d{4}\z/.freeze
    VALID_PHONE_NUMBER = /\A\d{10}$|^\d{11}\z/.freeze

    validates :post_code, format: {with:VALID_POST_CODE, message: "Post code Input correctly"}
    validates :phone_number, format: {with: VALID_PHONE_NUMBER}
    validates :prefecture_id, numericality: { other_than: 1, message: 'Select' }
  end

  def save
    order = Order.create(user_id: user_id, item_id: item_id)
    Shipment.create(post_code: post_code, prefecture_id: prefecture_id, city_town: city_town, address: address, building_name: building_name, phone_number: phone_number, order_id: order.id)
  end
end
