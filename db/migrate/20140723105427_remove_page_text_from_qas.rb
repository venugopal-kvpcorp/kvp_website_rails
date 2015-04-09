class RemovePageTextFromQas < ActiveRecord::Migration
  def up
  	remove_column :refinery_qas, :page_text
  end

  def down
  	add_column :refinery_qas, :page_text, :string
  end
end
