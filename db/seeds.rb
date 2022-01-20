# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
ShipmentItem.destroy_all
Item.destroy_all
Shipment.destroy_all

@item1 = Item.create!(title: "My little pony", description: "She so shiny", unit_price: 10.99, stock: 26)
@item2 = Item.create!(title: "GI Joe", description: "He's wearing camo", unit_price: 8.99, stock: 21)
@item3 = Item.create!(title: "Furby", description: "Creepy little critter", unit_price: 12.95, stock: 2)
