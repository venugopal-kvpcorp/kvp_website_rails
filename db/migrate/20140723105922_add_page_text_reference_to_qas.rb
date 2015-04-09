class AddPageTextReferenceToQas < ActiveRecord::Migration
  def up
  	add_column :refinery_qas, :page_text_id, :integer
    add_index :refinery_qas, :page_text_id
  end

  def down
  	remove_column :refinery_qas, :page_text_id, :integer
    remove_index :refinery_qas, :page_text_id
  end
end
