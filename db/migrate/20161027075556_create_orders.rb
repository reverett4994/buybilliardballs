class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.decimal :price, precision: 10, scale: 2
      t.string :ship_street
      t.string :ship_city
      t.string :ship_state
      t.string :ship_zip
      t.decimal :shipping, precision: 10, scale: 2

      t.timestamps null: false
    end
  end
end
