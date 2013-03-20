module SessionsHelper
	def sign_in(user)
		cookies.permanent[:remember_token] = user.remember_token
		self.current_user = user
	end

	def sign_in?
		!current_user.nil?
	end

	def current_user=(user)
		@current_user = user
	end

	def current_user
		begin
			@current_user ||= User.find_by_remember_token(cookies[:remember_token])
		rescue Exception
			nil
		end
	end

	def current_user?(user)
    user == current_user
  end

	def sign_out
		self.current_user = nil
		cookies.delete(:remember_token)
	end
end
