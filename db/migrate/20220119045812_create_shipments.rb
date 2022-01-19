class CreateShipments < ActiveRecord::Migration[5.2]
  def change
    create_table :shipments do |t|
      t.string :customer_name
      t.string :email

      t.timestamps
    end
  end
end
