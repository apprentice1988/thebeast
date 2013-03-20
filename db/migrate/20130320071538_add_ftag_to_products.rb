class AddFtagToProducts < ActiveRecord::Migration
  def change
    add_column :products, :ftag, :string
  end
end
