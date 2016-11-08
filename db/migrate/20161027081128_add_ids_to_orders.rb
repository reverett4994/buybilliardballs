class AddIdsToOrders < ActiveRecord::Migration
  def change
    add_column :orders, :user_id, :string

  end
end
