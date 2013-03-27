class LikesController < ApplicationController

	before_filter :correct_user, only: :destroy
	def show
		if sign_in?
			@likes = Like.where("user_id = ?", current_user.id)
		else
			redirect_to signin_path
		end
	end

	def create
		if sign_in?
			@like = Like.create(user_id: current_user.id, product_id: params[:product_id])
			@product = Product.find(params[:product_id])
			respond_to do |format|
				format.html { redirect_to(:back)}
				format.js
			end
		else
			redirect signin_path
		end
	end

	def destroy
		@like = Like.find(params[:id])
		@product = Product.find(@like.product_id)
		@like.destroy

		respond_to do |format|
			format.html{ redirect_to(:back)}
		end
	end

	private
		def correct_user
			@user = User.find[params[:id]]
			redirect_to root_path unless current_user?(@user)
		end
end
