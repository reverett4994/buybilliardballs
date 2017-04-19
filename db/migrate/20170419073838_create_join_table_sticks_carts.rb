class CreateJoinTableSticksCarts < ActiveRecord::Migration
  def change
    create_join_table :sticks, :carts do |t|
      # t.index [:stick_id, :cart_id]
      # t.index [:cart_id, :stick_id]
    end
  end
end
