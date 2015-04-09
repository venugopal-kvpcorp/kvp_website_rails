class AddTitleToRefineryPageTexts < ActiveRecord::Migration
  def change
    add_column :refinery_page_texts, :title, :string
  end
end
