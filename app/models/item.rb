class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :delivery_charge
  belongs_to_active_hash :delivery_area

  VALID_NUMBER = /\A[0-9]+\z/
  VALID_RANGE = 

  validates :name, presence: true
  validates :text, presence: true
  validates :category_id, presence: true, numericality: { other_than: 1 } 
  validates :status_id, presence: true, numericality: { other_than: 1 } 
  validates :delivery_charge_id, presence: true, numericality: { other_than: 1 } 
  validates :delivery_area_id, presence: true, numericality: { other_than: 1 } 
  validates :day_to_delivery_id, presence: true, numericality: { other_than: 1 } 
  validates :price, presence: true, 
  format: {with: VALID_NUMBER, message: 'Price Half-width number'}
  {
    :greater_than_or_equal_to => 300,
    :less_than_or_equal_to => 9999999,
    message: 'Price Out of setting range' 
  }
end
