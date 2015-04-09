class AddDefaultValueToShowInNavigationFromPages < ActiveRecord::Migration
  def change
    change_column :refinery_pages, :show_in_navigation, :boolean, :default => true
  end
end
