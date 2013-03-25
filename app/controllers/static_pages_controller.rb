class StaticPagesController < ApplicationController
  def home
    @products = Product.order("created_at DESC")
  end

  def newproduct
    @products = Product.order("created_at DESC").limit(15)
  end

  def beastflower
    @products = Product.where("ftag = ?", "flower").order('created_at DESC')
  end

  def fragrance
    @products = Product.where("ftag = ?", "perfume").order('created_at DESC')
  end

  def clothes
    @products = Product.where("ftag = ?", "dress").order('created_at DESC')
  end

  def grocery
    @products = Product.where("ftag = ?", "grocery").order('created_at DESC')
  end

  def cooperation
    @products = Product.where("ftag = ?", "cooperation").order('created_at DESC')
  end

  def story
  end
end
