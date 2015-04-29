module ApplicationHelper

	def is_contact?
		if params[:controller] == "homes" && (params[:action] == "contact")
		  true
		else
		  false
		end
     end	

     def author_name(post)
      post.author.name.presence || "admin"
    end	

end
