class AddChalkToCarts < ActiveRecord::Migration
  def change
    change_table :carts do |t|
      t.boolean :chalk, :default => false
    end
    change_table :orders do |t|
      t.boolean :chalk, :default => false
    end
  end
end
