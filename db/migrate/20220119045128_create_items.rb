class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.string :title
      t.string :description
      t.float :unit_price
      t.integer :stock

      t.timestamps
    end
  end
end
