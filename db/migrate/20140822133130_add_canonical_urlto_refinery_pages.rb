class AddCanonicalUrltoRefineryPages < ActiveRecord::Migration
  def up
  	add_column :refinery_pages, :canonical_url, :string
  end

  def down
  	remove_column :refinery_pages, :canonical_url
  end
end
