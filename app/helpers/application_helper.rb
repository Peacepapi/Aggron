module ApplicationHelper

# availiable to views
	def title(title)
		content_for(:title) {"#{title} | "}
	end

end
