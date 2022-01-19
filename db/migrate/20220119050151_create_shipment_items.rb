class CreateShipmentItems < ActiveRecord::Migration[5.2]
  def change
    create_table :shipment_items do |t|
      t.integer :quantity
      t.float :unit_price
      t.references :item
      t.references :shipment

      t.timestamps
    end
  end
end
