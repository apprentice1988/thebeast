module ApplicationHelper
	def bar(sidebar)
		unless sidebar.empty?
			render "shared/#{sidebar}"
		end
	end
end
