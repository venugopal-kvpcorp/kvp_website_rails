class AddDefaultValueToPagePriority < ActiveRecord::Migration
  def change
  	change_column :refinery_pages, :priority, :integer, :null => false, :default => 0
  end
end
