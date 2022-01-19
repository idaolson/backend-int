require 'rails_helper'

RSpec.describe "Item show" do
  before :each do
    @item = Item.create!(title: "Polly pocket", description: "Cute and tiny", unit_price: 12.96, stock: 98)
  end

  it "displays an item's attributes" do
    visit item_path(@item)

    expect(page).to have_content(@item.title)
    expect(page).to have_content(@item.description)
    expect(page).to have_content(@item.unit_price)
    expect(page).to have_content(@item.stock)
  end     

  it "has a link to update info" do

    visit item_path(@item)

    click_link 'Edit this item'

    expect(current_path).to eq(edit_item_path(@item))
  end
end
