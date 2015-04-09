class AddGplusLinkToRefineryBlogPosts < ActiveRecord::Migration
  def change
    add_column :refinery_blog_posts, :gplus_link, :string
  end
end
