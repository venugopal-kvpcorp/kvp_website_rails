class AddLogoUrlToRefineryMedia < ActiveRecord::Migration
  def up
  	add_column :refinery_media, :logo_link, :string
  end

  def down
  	remove_column :refinery_media, :logo_link, :string
  end
end
