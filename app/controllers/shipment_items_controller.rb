class ShipmentItemsController < ApplicationController

  def create
    shipment_item_array = ShipmentItem.find_existing(shipment_item_params) # checks if there's already an existting shipment_item for the item
    if shipment_item_array.length > 0
      shipment_item = shipment_item_array.first
      shipment_item.update(quantity: (shipment_item.quantity + shipment_item_params["quantity"].to_i)) # increments the quantity if the shipment-item exists
    else 
      shipment_item = ShipmentItem.create(shipment_item_params) # creates the shipment item if it doesn't already exit
    end 

    item = Item.find_by(id: shipment_item.item_id)
    item.update(stock: (item.stock - params[:quantity].to_i)) # reduces the available stock of the item by the quantity of the shipment_item
    redirect_to shipment_path(shipment_item.shipment_id)
  end 

  private
  def shipment_item_params
    params.permit(:quantity, :unit_price, :item_id, :shipment_id)
  end 
end 