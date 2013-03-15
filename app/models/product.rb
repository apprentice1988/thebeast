class Product < ActiveRecord::Base
  attr_accessible :description, :image_url, :price, :title
  validates :description, presence: true
  validates :image_url, presence: true
  validates :price, presence: true
  validates :title, presence: true 
end
