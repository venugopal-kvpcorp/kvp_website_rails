class AddShowInNavigationToRefineryPages < ActiveRecord::Migration
  def self.up
    add_column :refinery_pages, :show_in_navigation, :boolean, :default => false
  end

  def self.down
    remove_column :refinery_pages, :show_in_navigation
  end
end
