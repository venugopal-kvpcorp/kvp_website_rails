module Refinery
  module PressReleases
    class PressRelease < Refinery::Core::BaseModel
      self.table_name = 'refinery_press_releases'

      attr_accessible :title, :published_place, :published_date, :content, :link, :position

      validates :title, :presence => true, :uniqueness => true
    end
  end
end
