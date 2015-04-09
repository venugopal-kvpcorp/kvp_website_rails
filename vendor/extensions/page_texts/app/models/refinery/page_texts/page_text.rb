module Refinery
  module PageTexts
    class PageText < Refinery::Core::BaseModel
      self.table_name = 'refinery_page_texts'

      attr_accessible :key, :value, :page, :position, :title

      validates :key, :presence => true, :uniqueness => true

      def value
        Erubis::Eruby.new(read_attribute(:value)).result rescue ""
      end

      def self.create_page_text(key, file_name)
	      file = Rails.root.join('app', 'views', 'page_parts', file_name)
	      template = ( File.read(file) )
	      page_text_params = { :value => template, :key => key, :page => "static" }
	      create(page_text_params)
	    end

    end
  end
end
