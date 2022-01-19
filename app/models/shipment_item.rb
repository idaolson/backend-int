class ShipmentItem < ApplicationRecord
  belongs_to :item
  belongs_to :shipment
  validates :quantity, :unit_price, :item_id, :shipment_id, presence: true
end
