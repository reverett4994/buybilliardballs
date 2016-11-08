class AddTableForOrdersAndBalls2 < ActiveRecord::Migration
  def change
    create_table :balls_orders, id: false do |t|
      t.belongs_to :ball, index: true
      t.belongs_to :order, index: true
    end
  end
end
