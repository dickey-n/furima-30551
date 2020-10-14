class Item < ApplicationRecord
  VALID_NUMBER = /\A[0-9]+\z/
  VALID_RANGE = 

  validates :name, presence: true
  validates :text, presence: true
  validates :category_id, presence: true
  validates :status_id, presence: true
  validates :delivery_charge_id, presence: true
  validates :delivery_area_id, presence: true
  validates :day_to_delivery_id, presence: true
  validates :price, presence: true, 
  format: {with: VALID_NUMBER, message: 'Price Half-width number'}
  {
    :greater_than_or_equal_to => 300,
    :less_than_or_equal_to => 9999999,
    message: 'Price Out of setting range' 
  }
end
