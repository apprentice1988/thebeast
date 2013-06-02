class UsersController < ApplicationController

  #before_filter :signed_in_user, only: [:edit, :update, :like]
  #before_filter :correct_user, only: [:edit, :update]
  #before_filter :admin_user, only: [:index, :destroy]
  
  def index
    @users = User.all? 
  end

  def new
  	@user = User.new
  end

  def show
  	@user = User.find(params[:id])
  end

  #def create
  	#@user = User.new(params[:user])
  	#if @user.save
      #@user.cart = Cart.new(user_id: @user.id)
      #sign_in @user 
      #flash[:success] = "Welcome to the Sample App!"
      #redirect_to root_path
  	#else
  		#render 'new'
  	#end    
  #end

  def edit
  end

  #def update
    #if @user.update_attributes(params[:user])
      #flash[:success] = "Profile updated"
      #sign_in @user
      #redirect_to @user
    #else
      #render 'edit'
    #end
  #end

  #def destroy
    #@user = User.find(params[:id])
  #end


  private
    def signed_in_user
      redirect_to signin_url, notice: "Please sign in!" unless sign_in?
    end

    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_path) unless current_user?(@user)
    end

    def admin_user
      redirect_to root_path unless sign_in? && current_user.admin?
    end

end
