module ApplicationHelper
	def bar(sidebar)
		render "shared/#{sidebar}"
	end
end
