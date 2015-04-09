class AddShowInSiteMapTpPages < ActiveRecord::Migration
  def up
    add_column :refinery_pages, :show_in_sitemap, :boolean, :default => true
  end

  def down
    remove_column :refinery_pages, :show_in_sitemap
  end
end
