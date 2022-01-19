class ItemsController < ApplicationController
  def index
    @items = Item.all
  end 
end 







# index
# new
# create
# show
# edit
# update
# destroy