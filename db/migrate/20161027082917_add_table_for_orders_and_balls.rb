class AddTableForOrdersAndBalls < ActiveRecord::Migration
  def change
    create_table :orders_balls, id: false do |t|
      t.belongs_to :order, index: true
      t.belongs_to :ball, index: true
    end
  end
end
