module Refinery
  module Qas
    class QasController < ::ApplicationController

      before_filter :authorize_refinery_user
      before_filter :find_all_qas
      before_filter :find_page

      def index
        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @qa in the line below:
        present(@page)
      end

      def show
        @qa = Qa.find(params[:id])

        # you can use meta fields from your model instead (e.g. browser_title)
        # by swapping @page for @qa in the line below:
        present(@page)
      end

    protected

      def find_all_qas
        @qas = Qa.where("page_id is NOT NULL").order('position ASC')
      end

      def find_page
        @page = ::Refinery::Page.where(:link_url => "/qas").first
      end

    end
  end
end
