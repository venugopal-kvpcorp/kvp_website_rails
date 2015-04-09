class RemovePageTextIdFromRefineryQas < ActiveRecord::Migration
  def up
    remove_column :refinery_qas, :page_text_id
  end

  def down
    add_column :refinery_qas, :page_text_id, :integer
  end
end
