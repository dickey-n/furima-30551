class Shipment < ApplicationRecord
  belongs_to :order

  with_options presence: true do
    validates :post_code
    validates :city_town
    validates :address

    VALID_POST_CODE = /\A\d{3}[-]\d{4}\z/
    VALID_PHONE_NUMBER = /\A\d{10}$|^\d{11}\z/

    validates :prefecture_id, format: {with:VALID_POST_CODE, message: "Postal code Input correctly"}
    validates :phone_number, format: {with: VALID_PHONE_NUMBER}
  end
end
