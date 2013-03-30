class Image < ActiveRecord::Base
  attr_accessible :content_type, :file_name, :product_id, :image
  belongs_to :imageable, :polymorphic => true
  mount_uploader :image, ImageUploader
end
