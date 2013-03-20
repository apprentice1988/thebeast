class StaticPagesController < ApplicationController
  def home
    @products = Product.order("created_at DESC")
  end

  def newproduct
    @products = Product.order("created_at DESC").limit(15)
  end

  def beastflower
    @products = Product.find_all_by_ftag("flower").order('created_at DESC')
  end

  def fragrance
    @products = Product.find_all_by_ftag("perfume").order('created_at DESC')
  end

  def clothes
    @products = Product.find_all_by_ftag("dress").order('created_at DESC')
  end

  def grocery
    @products = Product.find_all_by_ftag("grocery").order('created_at DESC')
  end

  def cooperation
    @products = Product.find_all_by_ftag("cooperation").order('created_at DESC')
  end

  def story
  end
end
