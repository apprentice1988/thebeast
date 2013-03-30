class Product < ActiveRecord::Base
  attr_accessible :description, :price, :title, :ftag, :images_attributes
  has_many :line_items
  has_one  :tagging
  has_one  :tag, :through => :tagging
  has_many :likes, dependent: :destroy
  has_many :users, through: :likes
  has_many :images, as: :imageable, :dependent => :destroy
  accepts_nested_attributes_for :images, :allow_destroy => true

  validates :description, presence: true
  validates :price, presence: true
  validates :title, presence: true 


  scope :tag_with, lambda{|tag_name| joins(:tags).where("tags.name = ?", tag_name)}
  
  searchable do 
    text :title, :description
  end
end
