require 'rails_helper'

RSpec.describe "Items CRUD" do 
  before :each do   
    @item1 = Item.create!(title: "My little pony", description: "She so shiny", unit_price: 10.99, stock: 26)
    @item2 = Item.create!(title: "GI Joe", description: "He's wearing camo", unit_price: 8.99, stock: 21)
    @item3 = Item.create!(title: "Furby", description: "Creepy little critter", unit_price: 12.95, stock: 2)
  end 

  it "shows an index of existing items" do
    visit items_path
    
    expect(page).to have_content(@item1.title)
    expect(page).to have_content(@item1.description)
    expect(page).to have_content(@item1.unit_price)
    expect(page).to have_content(@item1.stock)
    expect(page).to have_content(@item2.title)
    expect(page).to have_content(@item2.description)
    expect(page).to have_content(@item2.unit_price)
    expect(page).to have_content(@item2.stock)
    expect(page).to have_content(@item3.title)
    expect(page).to have_content(@item3.description)
    expect(page).to have_content(@item3.unit_price)
    expect(page).to have_content(@item3.stock)
  end 
end 