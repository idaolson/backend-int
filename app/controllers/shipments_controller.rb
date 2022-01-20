class ShipmentsController < ApplicationController
  def new
  end 

  def create
    @shipment = Shipment.new(shipment_params)
    if @shipment.save
      flash[:notice] = "Shipment created!" # this will show on the index page if the item was saved
      redirect_to shipment_path(@shipment)
    else
      flash[:notice] = "Shipment not created" # this will show on the new page if form entries are incomplete
      redirect_to new_shipment_path
    end 
  end 

  def show
    @items = Item.all
    @shipment = Shipment.find(params[:id])
    @shipment_items = ShipmentItem.get_shipment_items(@shipment)
  end 

  private

  def shipment_params
    params.permit(:customer_name, :email)
  end 
end 