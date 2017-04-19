class CreateSticks < ActiveRecord::Migration
  def change
    create_table :sticks do |t|
      t.string :title
      t.string :color
      t.decimal :length
      t.decimal :weight
      t.decimal :price

      t.timestamps null: false
    end
  end
end
