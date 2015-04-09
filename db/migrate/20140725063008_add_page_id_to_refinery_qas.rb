class AddPageIdToRefineryQas < ActiveRecord::Migration
  def change
    add_column :refinery_qas, :page_id, :integer
  end
end
