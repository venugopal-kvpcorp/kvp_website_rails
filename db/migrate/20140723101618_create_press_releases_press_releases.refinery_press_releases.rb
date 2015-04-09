# This migration comes from refinery_press_releases (originally 1)
class CreatePressReleasesPressReleases < ActiveRecord::Migration

  def up
    create_table :refinery_press_releases do |t|
      t.string :title
      t.datetime :published_at
      t.text :content
      t.text :link
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-press_releases"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/press_releases/press_releases"})
    end

    drop_table :refinery_press_releases

  end

end
