class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :delivery_charge
  belongs_to_active_hash :delivery_area
  belongs_to_active_hash :day_to_delivery
  has_one_attached :image

  validates :image, presence: true
  validates :name, presence: true
  validates :text, presence: true

  VALID_NUMBER = /[0-9]\d/

  validates :price, presence: true
  validates :price, format: { with: VALID_NUMBER, message: 'Half width number' }
  validates_inclusion_of :price, in: 300..9999999, message: "Out of setting range"

  validates :category_id, presence: true, numericality: { other_than: 1, message: 'Select' }
  validates :status_id, presence: true, numericality: { other_than: 1, message: 'Select' } 
  validates :delivery_charge_id, presence: true, numericality: { other_than: 1, message: 'Select' } 
  validates :delivery_area_id, presence: true, numericality: { other_than: 1,  message: 'Select' } 
  validates :day_to_delivery_id, presence: true, numericality: { other_than: 1, message: 'Select' }

  # validates :first_name, presence: true, format: { with: VALID_NAME, message: 'Full-width characters' }


end
