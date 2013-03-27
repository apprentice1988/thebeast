class CartsController < ApplicationController

  before_filter :correct_cart, only: :show
  before_filter :admin_user, only: [:index, :edit, :destroy]
  def index
    @carts = Cart.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @carts }
    end
  end

  # GET /carts/1
  # GET /carts/1.json
  def show
    begin
      @cart = Cart.find(params[:id])
      @line_items = @cart.line_items
    rescue NoMethodError
      logger.error "Attempt to access invalid cart #{params[:id]}"
      redirect_to root_url, notice: 'Invalid cart'
    else
      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @cart }
      end
    end
  end

  # GET /carts/new
  # GET /carts/new.json
  def new
    @cart = Cart.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @cart }
    end
  end

  # GET /carts/1/edit
  def edit
    @cart = Cart.find(params[:id])
  end

  # POST /carts
  # POST /carts.json
  def create
    @cart = Cart.new(params[:cart])

    respond_to do |format|
      if @cart.save
        format.html { redirect_to @cart, notice: 'Cart was successfully created.' }
        format.json { render json: @cart, status: :created, location: @cart }
      else
        format.html { render action: "new" }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @cart = current_user.cart
    @cart.line_items.delete

    respond_to do |format|
      format.html { redirect_to cart_path(@cart) }
      format.json { head :no_content }
    end
  end

  private
    def correct_cart
      redirect_to root_path unless current_cart == Cart.find(params[:id])

    end

    def admin_user
      redirect_to root_path unless sign_in? && current_user.admin?
    end
end
