module Refinery
  module People
    class Person < Refinery::Core::BaseModel
      self.table_name = 'refinery_people'

      attr_accessible :name, :designation, :qualification, :image_id, :description, :position, :twitter_profile_link, :linkedin_profile_link, :management_team, :directors

      validates :name, :presence => true, :uniqueness => true

      belongs_to :image, :class_name => '::Refinery::Image'


      def first_name
      	name.split.first
      end

      def short_description
      	clean! description.split[0...25].join(' ')
      end

      def long_description
      	clean! description
      end

      def image_url
        image.try(:url)
      end

      def image_alt_text
        "#{name} #{designation}"
      end

    private
    	def clean!(string)
      	ActionView::Base.full_sanitizer.sanitize(string)
      end

    end
  end
end
