module CartsHelper

	def current_cart
		begin
	  @current_cart ||= User.find_by_remember_token(cookies[:remember_token]).cart
  	rescue Exception
  		nil
 	  end
 	end
end
