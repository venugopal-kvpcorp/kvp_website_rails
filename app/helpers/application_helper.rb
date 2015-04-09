module ApplicationHelper

	def is_contact?
		if params[:controller] == "refinery/pages" && (params[:action] == "show" || params[:action] == "home") && !@page.blank? && @page.allow_repayment_widget == true
		  true
		else
		  false
		end
     end		

end
