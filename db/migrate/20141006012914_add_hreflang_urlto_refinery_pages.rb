class AddHreflangUrltoRefineryPages < ActiveRecord::Migration
  def up
  	add_column :refinery_pages, :hreflang_url, :string
  end

  def down
  	remove_column :refinery_pages, :hreflang_url
  end
end
