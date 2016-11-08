class AddOrderToSaleNumber < ActiveRecord::Migration
  def change
    add_column :orders, :sale_id, :string

  end
end
