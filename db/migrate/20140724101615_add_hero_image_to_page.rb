class AddHeroImageToPage < ActiveRecord::Migration
  def up
  	add_column :refinery_pages, :image_id, :integer
  end

  def down
  	remove_column :refinery_pages, :image_id
  end
end
