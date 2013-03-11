class AddSubProCityZoneAddPostcodeToUsers < ActiveRecord::Migration
  def change
    add_column :users, :subscription, :boolean
    add_column :users, :province, :string
    add_column :users, :city, :string
    add_column :users, :zone, :string
    add_column :users, :address, :string
    add_column :users, :postcode, :integer
  end
end
