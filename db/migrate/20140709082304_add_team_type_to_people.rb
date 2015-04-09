class AddTeamTypeToPeople < ActiveRecord::Migration
  def up
  	add_column :refinery_people, :management_team, :boolean, :default => false
  	add_column :refinery_people, :directors, :boolean, :default => false
  end

  def down
  	remove_column :refinery_people, :management_team, :boolean
  	remove_column :refinery_people, :directors, :boolean
  end
end
