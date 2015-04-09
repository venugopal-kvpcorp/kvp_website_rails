class AddKeywordsToPage < ActiveRecord::Migration
  def up
  	add_column :refinery_pages, :meta_keywords, :text
  end

  def down
  	remove_column :refinery_pages, :meta_keywords, :text
  end
end
