class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :user
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :delivery_charge
  belongs_to_active_hash :delivery_area
  belongs_to_active_hash :day_to_delivery
  has_one_attached :image

  with_options presence: true do
    validates :image
    validates :name
    validates :text

    VALID_NUMBER = /[0-9]\d/.freeze

    validates :price, format: { with: VALID_NUMBER, message: 'Half width number' }
    validates_inclusion_of :price, in: 300..9_999_999, message: 'Out of setting range'

    with_options numericality: { other_than: 1, message: 'Select' } do
      validates :category_id
      validates :status_id
      validates :delivery_charge_id
      validates :delivery_area_id
      validates :day_to_delivery_id
    end
  end
end
