class RemoveColumnToImages < ActiveRecord::Migration
  def up
  	remove_column :images, :file_name, :product_id
  end

  def down
  end
end
