module Refinery
  module Qas
    class Qa < Refinery::Core::BaseModel
      self.table_name = 'refinery_qas'

      attr_accessible :question, :answer, :page_id, :position

      belongs_to :faq, :class_name => "Refinery::Page", :foreign_key => "page_id"

      validates :question, :presence => true, :uniqueness => true

      acts_as_indexed :fields => [:question, :answer]

    end
  end
end
