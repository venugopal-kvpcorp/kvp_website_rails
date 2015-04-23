module ApplicationHelper

	def is_contact?
		if params[:controller] == "homes" && (params[:action] == "contact")
		  true
		else
		  false
		end
     end		

end
