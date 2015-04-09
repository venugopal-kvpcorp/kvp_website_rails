class RemovePublishedAtFromRefineryPressReleases < ActiveRecord::Migration
  def up
    remove_column :refinery_press_releases, :published_at
    add_column :refinery_press_releases, :published_place, :string
    add_column :refinery_press_releases, :published_date, :date
  end

  def down
    add_column :refinery_press_releases, :published_at, :datetime
    remove_column :refinery_press_releases, :published_place
    remove_column :refinery_press_releases, :published_date
  end
end
