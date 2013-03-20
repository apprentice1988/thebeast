class LineItem < ActiveRecord::Base
  attr_accessible :cart_id, :product_id
  validates :product_id, presence: true
  validates :cart_id, presence: true
  belongs_to :product 
  belongs_to :cart
end
