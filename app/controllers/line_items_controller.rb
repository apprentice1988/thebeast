class LineItemsController < ApplicationController

  before_filter :admin_user, only: :index

  def index
    @line_items = LineItem.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @line_items }
    end
  end


  def create
    if current_cart.nil?
      @cart = Cart.create(params[:cart])
      cookies[:cart_id] = { :value => @cart.id , :expires => 1.hour.from_now }
      @line_items = LineItem.create(product_id: params[:product_id], cart_id: @cart.id)
      redirect_to cart_path(@cart)
    else
      @cart = current_cart
      current_item = @cart.line_items.find_by_product_id(params[:product_id])
      if current_item
        flash[:notice]="This product is already in cart"
        redirect_to(:back)
      else
        @line_item = @cart.line_items.build(product_id: params[:product_id])
        @line_item.save
        redirect_to cart_path(@cart)
      end
    end
  end
   

  def destroy
    @cart = current_cart
    @line_item = LineItem.find(params[:id])
    @line_item.destroy

    respond_to do |format|
      format.html { redirect_to cart_path(@cart) }
      format.json { head :no_content }
    end
  end
  private 
    def admin_user
      redirect_to root_path unless sign_in? && current_user.admin?
    end

end
