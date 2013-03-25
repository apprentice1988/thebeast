module CartsHelper

	def current_cart
		begin
	  	 @current_cart = Cart.find(cookies[:cart_id]) || current_user.cart 
	  rescue Exception
	  	current_cart = nil
	  end
 	end 	
end
