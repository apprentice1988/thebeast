class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :title
      t.text :description
      t.array :image_url
      t.decimal :price, precision: 8, scale: 0

      t.timestamps
    end
  end
end
