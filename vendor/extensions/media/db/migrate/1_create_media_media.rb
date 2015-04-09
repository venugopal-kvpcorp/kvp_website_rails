class CreateMediaMedia < ActiveRecord::Migration

  def up
    create_table :refinery_media do |t|
      t.string :title
      t.string :tags
      t.datetime :published_at
      t.text :description
      t.string :link
      t.integer :logo_id
      t.integer :additional_image_id
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-media"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/media/media"})
    end

    drop_table :refinery_media

  end

end
