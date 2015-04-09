class RemoveIndexPages < ActiveRecord::Migration
  def up
  	if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-index_pages"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/index_pages/index_pages"})
    end

    drop_table :refinery_index_pages
  end

  def down
  	create_table :refinery_index_pages do |t|
      t.string :key
      t.text :value
      t.integer :position

      t.timestamps
    end
  end
end
