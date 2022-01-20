require 'rails_helper'

RSpec.describe "Shipments new / create" do 
  it "creates a new shipment" do 
    visit items_path
    click_link "Create a shipment"

    expect(current_path).to eq(new_shipment_path)

    fill_in "Customer name", with: "Ida Olson"
    fill_in "Email address", with: "idaolson@mail.com"
    click_button "Create shipment"

    shipment = Shipment.last
   
    expect(current_path).to eq(shipment_path(shipment))
    expect(page).to have_content("Ida Olson")
    expect(page).to have_content("idaolson@mail.com")
  end 

  it "doesn't create a shipment if attributes are missing" do 
    visit items_path
    click_link "Create a shipment"

    expect(current_path).to eq(new_shipment_path)

    fill_in "Customer name", with: "Ida Olson"
    click_button "Create shipment"
   
    expect(current_path).to eq(new_shipment_path)
    expect(page).to have_content("Shipment not created") 
  end 
end 