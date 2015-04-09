# This migration comes from refinery_index_pages (originally 1)
class CreateIndexPagesIndexPages < ActiveRecord::Migration

  def up
    create_table :refinery_index_pages do |t|
      t.string :key
      t.text :value
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-index_pages"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/index_pages/index_pages"})
    end

    drop_table :refinery_index_pages

  end

end
