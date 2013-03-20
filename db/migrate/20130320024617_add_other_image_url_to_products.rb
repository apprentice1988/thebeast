class AddOtherImageUrlToProducts < ActiveRecord::Migration
  def change
    add_column :products, :image_url1, :string
    add_column :products, :image_url2, :string
    add_column :products, :image_url3, :string
    add_column :products, :image_url4, :string
  end
end
