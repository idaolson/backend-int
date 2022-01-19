require 'rails_helper'

RSpec.describe "Item show/destroy" do
  before :each do
    Item.destroy_all
    @item1 = Item.create!(title: "My little pony", description: "She so shiny", unit_price: 10.99, stock: 26)
    @item2 = Item.create!(title: "GI Joe", description: "He's wearing camo", unit_price: 8.99, stock: 21)
    @item3 = Item.create!(title: "Furby", description: "Creepy little critter", unit_price: 12.95, stock: 2)
    @item4 = Item.create!(title: "Polly pocket", description: "Cute and tiny", unit_price: 12.96, stock: 98)
  end

  it "displays an item's attributes" do
    visit item_path(@item4)

    expect(page).to have_content(@item4.title)
    expect(page).to have_content(@item4.description)
    expect(page).to have_content(@item4.unit_price)
    expect(page).to have_content(@item4.stock)
  end     

  it "has a link to update info" do

    visit item_path(@item4)

    click_link 'Edit this item'

    expect(current_path).to eq(edit_item_path(@item4))
  end

  it "has a link to delete an item " do
    visit item_path(@item4)

    click_link 'Delete this item'

    expect(current_path).to eq(items_path)
    save_and_open_page
    expect(page).to_not have_content(@item4.title) 
    expect(page).to_not have_content(@item4.description) 
    expect(page).to_not have_content(@item4.unit_price) 
    expect(page).to_not have_content(@item4.stock) 
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
