class Order < ApplicationRecord
  has_one    :shipment
  belongs_to :item
end
