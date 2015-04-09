module Refinery
  module PageTexts
    module Admin
      class PageTextsController < ::Refinery::AdminController

        crudify :'refinery/page_texts/page_text',
                :title_attribute => 'key',
                :xhr_paging => true

      end
    end
  end
end
