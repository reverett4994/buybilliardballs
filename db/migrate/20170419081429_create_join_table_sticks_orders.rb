class CreateJoinTableSticksOrders < ActiveRecord::Migration
  def change
    create_join_table :sticks, :orders do |t|
      # t.index [:stick_id, :order_id]
      # t.index [:order_id, :stick_id]
    end
  end
end
