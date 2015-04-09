# This migration comes from refinery_qas (originally 1)
class CreateQasQas < ActiveRecord::Migration

  def up
    create_table :refinery_qas do |t|
      t.text :question
      t.text :answer
      t.string :page_text
      t.integer :position

      t.timestamps
    end

  end

  def down
    if defined?(::Refinery::UserPlugin)
      ::Refinery::UserPlugin.destroy_all({:name => "refinerycms-qas"})
    end

    if defined?(::Refinery::Page)
      ::Refinery::Page.delete_all({:link_url => "/qas/qas"})
    end

    drop_table :refinery_qas

  end

end
