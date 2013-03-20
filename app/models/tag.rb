class Tag < ActiveRecord::Base
  attr_accessible :name
  has_many :taggings
  has_many :products, :through => :taggings
  TAGS = ["flower", "perfume", "dress", "grocery", "cooperation"]
end
