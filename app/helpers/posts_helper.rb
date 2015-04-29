module PostsHelper
	def gplus_link(post)    
      post.author.gplus_link.presence || '#'
    end

    def author_name(post)
      post.author.name.presence || "admin"
    end
end