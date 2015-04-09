class AddDefaultValueToPagePriority < ActiveRecord::Migration
  def change
  	change_column :refinery_pages, :priority, :default => 0
  end
end
