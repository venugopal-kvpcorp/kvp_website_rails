class AddRichSnippetsFieldsToRefineryBlogPost < ActiveRecord::Migration
  def change
  	add_column :refinery_blog_posts, :rating, :float, :default => 3.5
  end
end
