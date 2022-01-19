class Item < ApplicationRecord
  has_many :shipment_items
  has_many :shipments, through: :shipment_items
  validates :title, :description, :unit_price, :stock, presence: true
end
