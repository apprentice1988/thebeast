class RemoveProductIdFromCarts < ActiveRecord::Migration
  def up
  	add_column :cart, :product_id
  end

  def down
  	remove_column :cart, :product_id
  end
end
