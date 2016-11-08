class CreateBalls < ActiveRecord::Migration
  def change
    create_table :balls do |t|
      t.integer :number
      t.string :color
      t.string :title
      t.decimal :price
      t.timestamps null: false
    end
  end
end
