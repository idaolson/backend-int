require 'rails_helper'

RSpec.describe "Item edit/update" do
  before :each do
    @item = Item.create!(title: "Polly pocket", description: "Cute and tiny", unit_price: 12.96, stock: 98)
  end

  it "has an edit form to updates an item" do
    visit edit_item_path(@item)

    fill_in "Item title", with: "Rainbow Brite"
    fill_in "Item description", with: "Taste the rainbow!"
    fill_in "Price per unit", with: 17.99
    click_button "Update item"

    expect(current_path).to eq(item_path(@item))
    expect(page).to have_content("Item updated!")
    expect(page).to have_content("Rainbow Brite")
    expect(page).to have_content("Taste the rainbow!")
    expect(page).to have_content(17.99)
  end
end
