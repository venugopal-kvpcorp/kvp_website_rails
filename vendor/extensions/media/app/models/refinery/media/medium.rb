module Refinery
  module Media
    class Medium < Refinery::Core::BaseModel
      self.table_name = 'refinery_media'

      attr_accessible :title, :tags, :published_at, :description, :link, :logo_id, :additional_image_id, :position, :logo_link

      validates :title, :presence => true, :uniqueness => true

      belongs_to :logo, :class_name => '::Refinery::Image'

      belongs_to :additional_image, :class_name => '::Refinery::Image'
    end
  end
end
