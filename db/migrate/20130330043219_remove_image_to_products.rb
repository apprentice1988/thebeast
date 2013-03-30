class RemoveImageToProducts < ActiveRecord::Migration
  def up
  	remove_column :products, :image_url1, :image_url2, :image_url3, :image_url4, :image_url, :photo_url
  end

  def down
  end
end
