class ItemsController < ApplicationController
  def index
    @items = Item.all
  end 

  def new
  end 

  def create
    item = Item.new(item_params)
    if item.save
      flash[:notice] = "Item saved!" # this will show on the index page if the item was saved
      redirect_to items_path
    else
      flash[:notice] = "Item not created" # this will show on the new page if form entries are incomplete
      redirect_to new_item_path
    end 
  end

  def show
    @item = Item.find(params[:id])
  end 
  
  def edit
    @item = Item.find(params[:id])
  end 

  def update
    @item = Item.find(params[:id])
    if @item.update(item_params)
      flash[:notice] = "Item updated!" 
      redirect_to item_path(@item)
    else  
      flash[:notice] = "Item not updated" 
      redirect_to edit_item_path(@item)
    end 
  end 
  

  private

  def item_params
    params.permit(:title, :description, :unit_price, :stock)
  end 
end 



# destroy