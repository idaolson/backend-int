class ShipmentItem < ApplicationRecord
  belongs_to :item
  belongs_to :shipment
  validates :quantity, :unit_price, :item_id, :shipment_id, presence: true

  def self.get_shipment_items(shipment)
    shipments = where(shipment_id: shipment.id)
  end 

  def self.find_existing(params)
    where(shipment_id: params["shipment_id"].to_i, item_id: params["item_id"].to_i)
  end 
end


