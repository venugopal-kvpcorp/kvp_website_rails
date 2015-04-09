class AddNameGPlusLinkToRefineryUsers < ActiveRecord::Migration
  def change
  	remove_column :refinery_blog_posts, :gplus_link
  	add_column :refinery_users, :name, :string
  	add_column :refinery_users, :gplus_link, :string
  end
end
