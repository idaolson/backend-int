require 'rails_helper'

RSpec.describe "Shipments new / create" do 
  before :each do 
    Item.destroy_all
    Shipment.destroy_all
    @item1 = Item.create!(title: "My little pony", description: "She so shiny", unit_price: 10.99, stock: 26)
    @item2 = Item.create!(title: "GI Joe", description: "He's wearing camo", unit_price: 8.99, stock: 21)
    @item3 = Item.create!(title: "Furby", description: "Creepy little critter", unit_price: 12.95, stock: 2)
    @shipment = Shipment.create!(customer_name: "Ida Olson", email: "idaolson@mail.com")
  end 

  it "creates a new shipment" do 
    visit shipment_path(@shipment)

    shipment = Shipment.last
   
    expect(current_path).to eq(shipment_path(shipment))
    expect(page).to have_content("Ida Olson")
    expect(page).to have_content("idaolson@mail.com")
  end 

  it "adds items to the shipment and creates shipment_items" do 
    visit shipment_path(@shipment)

    save_and_open_page

    within "#item-#{@item1.id}" do
      fill_in "Quantity", with: 25
      click_button "Add to shipment"

      remaining = @item1.stock - 25
      expect(page).to have_content(remaining)
    end

    shipment_item = ShipmentItem.last
    within "#si-#{shipment_item.id}" do 
      expect(page).to have_content(@item1.title)
      expect(page).to have_content(@item1.unit_price)
      expect(page).to have_content(shipment_item.quantity)
    end 

    within "#item-#{@item1.id}" do
      fill_in "Quantity", with: 1
      click_button "Add to shipment"

      expect(page).to have_content(0)
    end

    shipment_item = ShipmentItem.last
    within "#si-#{shipment_item.id}" do 
      expect(page).to have_content(26)
    end 
  end 
end 