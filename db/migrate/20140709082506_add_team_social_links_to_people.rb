class AddTeamSocialLinksToPeople < ActiveRecord::Migration
  def up
  	add_column :refinery_people, :twitter_profile_link, :string
  	add_column :refinery_people, :linkedin_profile_link, :string
  end

  def down
  	remove_column :refinery_people, :twitter_profile_link, :string
  	remove_column :refinery_people, :linkedin_profile_link, :string
  end
end
