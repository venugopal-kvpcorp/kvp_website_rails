class AddLayoutTemplagesToRefineryPageParts < ActiveRecord::Migration
  def up
  	add_column :refinery_page_parts, :layout_templates, :string
  end

  def down
  	remove_column :refinery_page_parts, :layout_templates, :string
  end
end
