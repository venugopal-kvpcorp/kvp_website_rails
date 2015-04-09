class AddAlternateTextToRefineryImages < ActiveRecord::Migration
  def change
    add_column :refinery_images, :alternate_text, :string
  end
end
