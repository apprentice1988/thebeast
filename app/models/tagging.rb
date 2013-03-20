class Tagging < ActiveRecord::Base
  attr_accessible :product_id, :tag_id
  belongs_to :tag
  belongs_to :product
end
