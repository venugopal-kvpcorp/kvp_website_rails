module Refinery
  module PageTexts
    class PageTextsController < ::ApplicationController

      before_filter :authorize_refinery_user
      before_filter :find_all_page_texts
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @page_text in the line below:
        present(@page)
      end

      def show
        @page_text = PageText.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @page_text in the line below:
        present(@page)
      end

    protected

      def find_all_page_texts
        @page_texts = PageText.order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/page_texts").first
      end

    end
  end
end
