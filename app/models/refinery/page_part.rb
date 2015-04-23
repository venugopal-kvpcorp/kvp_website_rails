module Refinery
  class PagePart < Refinery::Core::BaseModel

    attr_accessible :title, :content, :position, :body, :refinery_page_id, :layout_templates
    belongs_to :page, :foreign_key => :refinery_page_id

    validates :title, :presence => true
    alias_attribute :content, :body

    translates :body if respond_to?(:translates)

    def to_param
      "page_part_#{title.downcase.gsub(/\W/, '_')}"
    end

    self.translation_class.send :attr_accessible, :locale if self.respond_to?(:translation_class)

    def body=(value)
      super

      #normalise_text_fields
    end

    #CUSTOM METHODS

    def body
      Erubis::Eruby.new(read_attribute(:body)).result rescue ""
    end

    def layout_templates
      read_attribute(:layout_templates).split(",") rescue []
    end

    def layout_templates=(layout_template_data)
      data = (layout_template_data.class == Array) ? layout_template_data.join(",") : layout_template_data
      write_attribute(:layout_templates, data)
    end

    def self.seeded_parts
      where(:refinery_page_id => nil)
    end

    def self.for_layout_template(layout_template)
      seeded_parts.where(" layout_templates like '%#{layout_template}%' ")
    end

    def self.global_parts
      for_layout_template("global")
    end

    def self.global_parts_dup
      global_parts.map(&:dup)
    end

    def self.create_page_part(page_part_params, file_name)
      file = Rails.root.join('app', 'views', 'page_parts', file_name)
      template = ( File.read(file) )
      page_part_params.merge!({ :body => template, :refinery_page_id => nil })
      create(page_part_params)
    end

  protected
    def normalise_text_fields
      if body? && body !~ %r{^<}
        self.body = "#{body.gsub("\r\n", "<br/>")}"
      end
    end

  end
end
