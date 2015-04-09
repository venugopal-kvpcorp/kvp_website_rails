class CreatePageTextsPageTexts < ActiveRecord::Migration

  def up
    create_table :refinery_page_texts do |t|
      t.string :key
      t.text :value
      t.string :page
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-page_texts"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/page_texts/page_texts"})
    end

    drop_table :refinery_page_texts

  end

end
