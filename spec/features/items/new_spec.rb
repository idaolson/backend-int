require 'rails_helper'

RSpec.describe "Items new / create" do 
  before :each do   
    @item1 = Item.create!(title: "My little pony", description: "She so shiny", unit_price: 10.99, stock: 26)
    @item2 = Item.create!(title: "GI Joe", description: "He's wearing camo", unit_price: 8.99, stock: 21)
    @item3 = Item.create!(title: "Furby", description: "Creepy little critter", unit_price: 12.95, stock: 2)
  end 

  it "creates a new item" do
    visit items_path
    click_link "Create new item"

    expect(current_path).to eq(new_item_path)

    fill_in "Item title", with: "Polly pocket"
    fill_in "Item description", with: "Cute and tiny"
    fill_in "Price per unit", with: 12.96
    fill_in "Quantity in stock", with: 98
    click_button "Create item"
   
    expect(current_path).to eq(items_path)
    expect(page).to have_content("Item saved!")
    expect(page).to have_content("Polly pocket")
  end 

  it "new item sad path" do
    visit items_path
    click_link "Create new item"

    expect(current_path).to eq(new_item_path)

    fill_in "Item title", with: "Polly pocket"
    fill_in "Quantity in stock", with: 98
    click_button "Create item"
  
    expect(current_path).to eq(new_item_path)
    expect(page).to have_content("Item not created")
  end
end
