class NewTableForCartsAndBalls < ActiveRecord::Migration
  def change
    create_table :balls_carts, id: false do |t|
      t.belongs_to :ball, index: true
      t.belongs_to :cart, index: true
    end
  end
end
