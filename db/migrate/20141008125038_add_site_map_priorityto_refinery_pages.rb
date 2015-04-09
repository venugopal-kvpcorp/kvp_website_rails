class AddSiteMapPrioritytoRefineryPages < ActiveRecord::Migration
  def up
  	add_column :refinery_pages, :sitemap_priority, :float, :default => 0.70, :null => false
  end

  def down
  	remove_column :refinery_pages, :sitemap_priority
  end
end
