class RemoveDefaultValueForShowInNavigationFromPages < ActiveRecord::Migration
  def up
    change_column :refinery_pages, :show_in_navigation, :boolean, :default => false
  end

  def down
    change_column :refinery_pages, :show_in_navigation, :boolean, :default => true
  end
end
