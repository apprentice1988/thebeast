class SessionsController < ApplicationController

	def new
	end

	def create
		user = User.find_by_email(params[:session][:email].downcase)
		if user && user.authenticate(params[:session][:password])
			sign_in user
			redirect_to root_path
		elsif user 
			flash[:error] = 'Password is wrong'
			render 'new'
		else
			flash[:error] = 'This email is unvalid'
			render 'new'
		end
	end

	def destroy
		sign_out
		redirect_to root_path
    @cart = Cart.create(params[:cart])
	end
end
