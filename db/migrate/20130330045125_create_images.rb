class CreateImages < ActiveRecord::Migration
  def change
    create_table :images do |t|
      t.integer :product_id
      t.string :file_name
      t.string :content_type

      t.timestamps
    end
  end
end
