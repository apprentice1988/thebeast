namespace :db do 
	desc "Fill database with sample data"
	task populate: :environment do 
		admin = User.create!(username: "jizilong",
													email: "jizilong1988@163.com",
													mobilephone: "18940883460",
													subscription: false,
													password: "jzl312",
													password_confirmation: "jzl312")
		admin.toggle!(:admin)
		cart1 = Cart.create!(user_id: 1)
	end
end