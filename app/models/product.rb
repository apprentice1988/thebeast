class Product < ActiveRecord::Base
  attr_accessible :description, :image_url, :image_url1, :image_url2, :image_url3, :image_url4, :price, :title, :photo_url, :ftag
  has_many :line_items
  has_one  :tagging
  has_one  :tag, :through => :tagging
  has_many :likes, dependent: :destroy
  has_many :users, through: :likes
  validates :description, presence: true
  validates :image_url, presence: true
  validates :price, presence: true
  validates :title, presence: true 

  mount_uploader :image_url, ImageUrlUploader
  mount_uploader :image_url1, ImageUrl1Uploader
  mount_uploader :image_url2, ImageUrl2Uploader
  mount_uploader :image_url3, ImageUrl3Uploader
  mount_uploader :image_url4, ImageUrl4Uploader
  mount_uploader :photo_url, PhotoUrlUploader
  scope :tag_with, lambda{|tag_name| joins(:tags).where("tags.name = ?", tag_name)}
  
  searchable do 
    text :title, :description
  end
end
