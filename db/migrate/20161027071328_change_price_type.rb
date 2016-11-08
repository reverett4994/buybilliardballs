class ChangePriceType < ActiveRecord::Migration
  def change
        remove_column :balls, :price
        add_column :balls, :price, :decimal, precision: 10, scale: 2
  end
end
