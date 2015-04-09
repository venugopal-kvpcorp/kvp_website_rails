class AddOrderFieldToPage < ActiveRecord::Migration
  def up
  	add_column :refinery_pages, :priority, :integer
  end

  def down
  	remove_column :refinery_pages, :priority, :integer
  end
end
