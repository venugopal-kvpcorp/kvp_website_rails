class AddDisplayLinkTextToRefineryPages < ActiveRecord::Migration
  def self.up
    add_column :refinery_pages, :display_link_text, :string
  end

  def self.down
    remove_column :refinery_pages, :display_link_text
  end
end
